#include "uartControl.h"

#ifdef __linux__

#else

#include "platform.h"
#include <xbasic_types.h>
#include "xparameters.h"
#include "xuartps.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include <stdio.h>
#include <stdlib.h>
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_INT_IRQ_ID	XPAR_XUARTPS_0_INTR

#endif
#define UART_BUFFER_SIZE 3

static char contrast = 4;
static XUartPs Uart_Ps;		/* The instance of the UART Driver */
static XScuGic InterruptController;	/* Instance of the Interrupt Controller */
static XUartPs_Config *Config;
static u8 uartBuffer[UART_BUFFER_SIZE];	/* Buffer for Receiving Data */

int threshold = 6;
int blanking_width=0;
int blanking_position = 8;
const char THRESH_VALS[8] = {0, 100, 200, 210, 220, 230, 240, 255};

int frameRateSelect = 1;
const float FRAME_RATE_VALS[4] = {30.0,60.0,90.0,120.0};

static int SetupInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId);

void Handler(void *CallBackRef, u32 Event, unsigned int EventData);

void setContrast(){
	memcpy(gpioBrightAddr,&contrast,1);
}

void setThreshold(){
	//memcpy(gpioThreshAddr,&THRESH_VALS[threshold],1);
//	memcpy(gpioBlankingAddr,)
	XGpio_DiscreteWrite(&Gpio_blanking,2,blanking_position);


}

int setupUartControl(){
	int Status;
	u32 IntrMask;

	Config = XUartPs_LookupConfig(UART_DEVICE_ID);
	if (NULL == Config) {
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XUartPs_SetBaudRate(&Uart_Ps, 115200);

	/*
	 * Check hardware build.
	 */
	Status = XUartPs_SelfTest(&Uart_Ps);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the UART to the interrupt subsystem such that interrupts
	 * can occur. This function is application specific.
	 */
	Status = SetupInterruptSystem(&InterruptController, &Uart_Ps, UART_INT_IRQ_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the handlers for the UART that will be called from the
	 * interrupt context when data has been sent and received, specify
	 * a pointer to the UART driver instance as the callback reference
	 * so the handlers are able to access the instance data
	 */
	XUartPs_SetHandler(&Uart_Ps, (XUartPs_Handler)Handler, &Uart_Ps);

	/*
	 * Enable the interrupt of the UART so interrupts will occur
	 */
	IntrMask =
			XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
			XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
	   		XUARTPS_IXR_RXOVR;
	XUartPs_SetInterruptMask(&Uart_Ps, IntrMask);

	/*
	 * Set the receiver timeout. If it is not set, and the last few bytes
	 * of data do not trigger the over-water or full interrupt, the bytes
	 * will not be received. By default it is disabled.
	 *
	 * The setting of 8 will timeout after 8 x 4 = 32 character times.
	 * Increase the time out value if baud rate is high, decrease it if
	 * baud rate is low.
	 */
	XUartPs_SetRecvTimeout(&Uart_Ps, 255);

	return 0;

}
/*****************************************************************************/
/**
*
* This function sets up the interrupt system so interrupts can occur for the
* Uart. This function is application-specific. The user should modify this
* function to fit the application.
*
* @param	IntcInstancePtr is a pointer to the instance of the INTC.
* @param	UartInstancePtr contains a pointer to the instance of the UART
*		driver which is going to be connected to the interrupt
*		controller.
* @param	UartIntrId is the interrupt Id and is typically
*		XPAR_<UARTPS_instance>_INTR value from xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
****************************************************************************/
static int SetupInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId)
{
	int Status;

#ifndef TESTAPP_GEN
	XScuGic_Config *IntcConfig; /* Config for interrupt controller */

	/*
	 * Initialize the interrupt controller driver
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				IntcInstancePtr);
#endif

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler
	 * performs the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(IntcInstancePtr, UartIntrId,
				  (Xil_ExceptionHandler) XUartPs_InterruptHandler,
				  (void *) UartInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XScuGic_Enable(IntcInstancePtr, UartIntrId);


#ifndef TESTAPP_GEN
	/*
	 * Enable interrupts
	 */
	 Xil_ExceptionEnable();
#endif

	return XST_SUCCESS;
}

void Handler(void *CallBackRef, u32 Event, unsigned int EventData)
{
	/*
	 * All of the data has been sent
	 */
	if (Event == XUARTPS_EVENT_SENT_DATA);

	/*
	 * All of the data has been received
	 */
	if (Event == XUARTPS_EVENT_RECV_DATA) {
		XUartPs_Recv(&Uart_Ps, uartBuffer, UART_BUFFER_SIZE);
		//XUartPs_Send(&Uart_Ps, RecvBuffer, TEST_BUFFER_SIZE);
		if(uartBuffer[2] == 0x41){//Up Arrow: 1B 5B 41
			if(contrast != 8)
				contrast++;
		}
		if(uartBuffer[2] == 0x42){//Down Arrow: 1B 5B 42
			if(contrast != 0)
				contrast--;
		}
		if(uartBuffer[2] == 0x43){//Right Arrow: 1B 5B 43
			roadPosition++;
		}
		if(uartBuffer[2] == 0x44){//Left Arrow: 1B 5B 44
			roadPosition--;
		}
		setContrast();


	}

	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT){
		XUartPs_Recv(&Uart_Ps, uartBuffer, UART_BUFFER_SIZE);
		//Letter characters received are ascii
		//w and s used to increase and shrink the size of the road
		XUartPs_Send(&Uart_Ps, uartBuffer, 1);
		switch(uartBuffer[0]){
		case 0x77://w: 0x77
			roadSizeRight++;
			break;
		case 0x73://s: 0x73
			roadSizeRight--;
			break;
		case 0x71://q: 0x71
			roadSizeLeft++;
			break;
		case 0x61://a: 0x61
			roadSizeLeft--;
			break;
		case 0x63://c: 0x63
			calibrate = !calibrate;
			break;
		case 0x74://t: 0x74
			if( blanking_position < 15)
				blanking_position++;
			setThreshold();
			break;
		case 0x67://g: 0x67
			if(blanking_position > 0)
				blanking_position--;
			setThreshold();
			break;
		case 0x31://1: 0x31
			cross_row = 0;
			break;
		case 0x32://2: 0x32
			start_blink = 1;
			break;
		case 0x33://3: 0x33
			schl_xing_row = 0;
			break;
		case 0x72://r: 0x72
			start_recording = 1;
			break;
		case 0x70://p 0x70
			playback_idx = 0;
			break;
		case 0x65://e 0x65
			if(frameRateSelect < 3)
				frameRateSelect++;
			framerate = FRAME_RATE_VALS[frameRateSelect];
			printf("Framerate: %f", framerate);
			break;
		case 0x64://d
			if(frameRateSelect > 0)
				frameRateSelect--;
			framerate = FRAME_RATE_VALS[frameRateSelect];
			printf("Framerate: %f", framerate);
			break;
		case 0x79://y
			road_vert_pos--;
			break;
		case 0x68://h
			road_vert_pos++;
			break;
		}
	}


	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR);
}