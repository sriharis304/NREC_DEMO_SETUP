/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

//#include <stdio.h>
#include "platform.h"
#include <xbasic_types.h>
#include "xparameters.h"
#include <assert.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define WORD_WIDTH 16
#define NUM_TRIES 3
#define WIDTH 1024
#define HEIGHT 384
// Divide by 16 because there are 16 pixels to a word
// Multiply by 2 because our bram data width is 32, but we use 16
// So this is size in bytes
#define BUF_SIZE_BYTES WIDTH * HEIGHT / 8 //* 2

// Defines a triangle with 3 2d points
typedef struct {
	float x0;
	float y0;
	float x1;
	float y1;
	float x2;
	float y2;
} triangle;

//void print(char *str);
static u16* maskAddr = (u16 *)0x40000000;//XPAR_BRAM_0_BASEADDR;
static const int width = WIDTH;
static const int height = HEIGHT;
static triangle tris[NUM_TRIES];
static u16 buffer[BUF_SIZE_BYTES / sizeof(u16)];

// Determines whether the testpoint (xt,yt) is 'inside' the other two lines
// This is used in triangle rasterization
int inside(double x0, double y0,
           double x1, double y1,
           double xt, double yt) {
    return ((x1 - x0) * (yt - y0) - (y1 - y0) * (xt - x0));
}

inline void setBit(int row, int col, u16 *buf) {
	int index = (row * width + col) / 16;
	int bitIndex = col % 16;
	u16 oldVal = buf[2*index];
	u16 newVal = oldVal | (0x8000 >> bitIndex);

	buf[2*index] = newVal;
}

// Accepts 3 points to be rasterized into the frame buffer.
// These are specified here in normalized space for convenience
void rasterize_triangle( triangle *tri) {
    double xmin, xmax, ymin, ymax;
    double x0, y0, x1, y1, x2, y2;
    int xmini, xmaxi, ymini, ymaxi;
    int xt, yt;
    int s1, s2, s3;
    u16 *buf;

    x0 = tri->x0;
    y0 = tri->y0;
    x1 = tri->x1;
    y1 = tri->y1;
    x2 = tri->x2;
    y2 = tri->y2;

    // Set the rendering buffer; this can be BRAM or local memory
    buf = buffer;

    // Order the points in counter-clockwise order
    if (inside(x0, y0, x1, y1, x2, y2) > 0) {
        // swap points x1,y1 and x2,y2
        double temp = x1;
        x1 = x2;
        x2 = temp;
        temp = y1;
        y1 = y2;
        y2 = temp;
    }

    xmin = x1 < x2 ? (x0 < x1 ? x0 : x1) : (x0 < x2 ? x0 : x2);
    ymin = y1 < y2 ? (y0 < y1 ? y0 : y1) : (y0 < y2 ? y0 : y2);
    xmax = x1 > x2 ? (x0 > x1 ? x0 : x1) : (x0 > x2 ? x0 : x2);
    ymax = y1 > y2 ? (y0 > y1 ? y0 : y1) : (y0 > y2 ? y0 : y2);

    xmini = (int) xmin;
    ymini = (int) ymin;
    xmaxi = ((int) xmax)+1;
    ymaxi = ((int) ymax)+1;

    for (yt = ymini; yt < ymaxi; yt++) {
        for (xt = xmini; xt < xmaxi; xt++) {
            if (xt < 0 || xt >= width ||
                yt < 0 || yt >= height) {
                continue;
            }

            // Calculate whether these points are 'inside' the line
            s1 = inside(x0, y0, x1, y1, xt, yt);
            s2 = inside(x1, y1, x2, y2, xt, yt);
            s3 = inside(x2, y2, x0, y0, xt, yt);

            if ((s1 >= 0 && s2 >= 0 && s3 >= 0) ||
                (s1 <= 0 && s2 <= 0 && s3 <= 0)) {
            	setBit(yt, xt, buf);
            }
        }
    }
}

void walkTriangle(triangle *tri) {
	int w;
	const int s = 5;
	w = rand() % s;
	tri->x0 += w - 3;
	w = rand() % s;
	tri->y0 += w - 3;
	w = rand() % s;
	tri->x1 += w - 3;
	w = rand() % s;
	tri->y1 += w - 3;
	w = rand() % s;
	tri->x2 += w - 3;
	w = rand() % s;
	tri->y2 += w - 3;
}


// Renders the triangles in the buffer
void renderTriangles()
{
	int i;
	for (i = 0; i < NUM_TRIES; i++) {
		rasterize_triangle(&tris[i]);
		//walkTriangle(&tris[i]);
	}
}

// This takes the row and first column, and returns the batch of 16 pixels
u16 renderBox(int row, int col0, int boxrow, int boxcol)
{
	u16 value = 0x00;
	// Note that this implies a coord space where the origin is at the top left of the image
	const int boxLength = height / 3;
	const int left 		= boxcol - boxLength/2;
	const int right 	= boxcol + boxLength/2;
	const int top		= boxrow - boxLength/2;
	const int bot		= boxrow + boxLength/2;

	if (row >= top &&
		row < bot) {
		// Get the bit position of the start of the box, relative to col 0
		int colStart = left - col0;
		int colEnd = right - col0;

		// Clamp up to 0
		colStart = (colStart < 0) ? 0 : colStart;
		colEnd = (colEnd >= WORD_WIDTH) ? WORD_WIDTH - 1 : colEnd;

		// Check if the start and end overlap
		if (colStart < colEnd) {
			value = (unsigned)0xffff >> colStart;
			value = value ^ ((unsigned)0xffff >> (colEnd+1));
		}
	}
	return value;
}

void write_frame()
{
	int row, col;
	static int boxrow, boxcol;
	for (row = 0; row < height; row++) {
		for (col = 0; col < width; col+=16) {
			int index = (row * width + col)/16;
			assert(index < (width * height)/16);
			// We need to extend the address because every other set of 16 bits isn't used
			u16 *addr = &buffer[index];
			u16 value = renderBox(row, col, boxrow, boxcol);

			// This determines the actual pattern of the light
			*addr = value;
		}
	}

	//Render the triangles on top of the box
//	renderTriangles();
	//boxrow = (boxrow + 1) % height;
	//boxcol = (boxcol + 1) % width;

	boxrow =  height/2;
    boxcol =  width/2;
}

void initTriangles() {
	// It's easier to think in normalized coordinates, so these are all specified in [0,1]
    tris[0].x0 = 0.25;
    tris[0].y0 = 0.25;
    tris[0].x1 = 0.25;
    tris[0].y1 = 0.6;
    tris[0].x2 = 0.35;
    tris[0].y2 = 0.35;

    tris[1].x0 = 0.75;
    tris[1].y0 = 0.75;
    tris[1].x1 = 0.75;
    tris[1].y1 = 0.4;
    tris[1].x2 = 0.65;
    tris[1].y2 = 0.65;

    tris[2].x0 = 0.47;
    tris[2].y0 = 0.1;
    tris[2].x1 = 0.53;
    tris[2].y1 = 0.1;
    tris[2].x2 = 0.5;
    tris[2].y2 = 0.13;

    // Convert from normalized coordinates into pixel coordinates
    int i;
    for (i = 0; i < NUM_TRIES; i++) {
    	tris[i].x0 *= width;
    	tris[i].y0 *= height;
    	tris[i].x1 *= width;
    	tris[i].y1 *= height;
    	tris[i].x2 *= width;
    	tris[i].y2 *= height;
    }
}

void copy_frame() {
	memcpy(maskAddr, buffer, BUF_SIZE_BYTES);
}

int main()
{
    init_platform();

    // Adds some triangles to the triangle render pipeline
    initTriangles();
	write_frame();
    	copy_frame();
    while (1) {
    	write_frame();
   	copy_frame();
    }

    cleanup_platform();
    return 0;
}
