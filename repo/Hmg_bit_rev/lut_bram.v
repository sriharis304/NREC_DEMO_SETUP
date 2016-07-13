module lut_bram(clka,clkb,ena,enb,wea,web,dia,dib, addra, addrb, doa, dob);
input	clka, clkb;
input	ena, enb,wea,web;
input	[15:0] addra, addrb;
output	[63:0] doa, dob;
input   [63:0] dia,dib;
reg		[63:0] RAM [0:49151];   //1024x384-1 : 0 // make dual port or wider !! --change this
reg		[63:0] doa, dob;
reg		[63:0] doa_temp;
reg [63:0] dob_temp;
/*
always @(posedge clka)
begin

	doa <=doa_temp;

end
*/
always @(posedge clkb)
begin
	if (enb)
	begin
	dob <=dob_temp;
	end
end



always @(posedge clka)
begin
	if (ena)
	begin
	if (wea) 
	begin
                RAM[addra]<=dia;
    end
    else
    begin
		doa<= RAM[addra];
		end
	end
end

always @(posedge clkb)  
begin
	if (enb)
	begin
		if (web) 
        begin
                    RAM[addrb]<=dib;
        end
        else
        begin
            dob_temp <= RAM[addrb];
        end
     end
end
initial begin
$readmemb("/home/ilim/Documents/Headlight/NREC_truck_setup/homography_luts/lut_bram-flipped.txt",RAM);
end
endmodule

module lut_offsets (clk, en,we,di ,addr, dout);
    input  clk;
    input  en,we;
    input [38:0] di;
    input  [8:0] addr;
    output [38:0] dout;
    reg    [38:0] RAM [383:0];
    reg    [38:0] dout;
    always @(posedge clk)
    begin
	if (en) begin
	if (we) 
        begin
                    RAM[addr]<=di;
        end
        else
        begin
		
            dout <= RAM[addr];
        end
    end
    end
    
    initial begin
    $readmemb("/home/ilim/Documents/Headlight/NREC_truck_setup/homography_luts/lut_offsets-flipped.txt",RAM);
    end
endmodule


/*
module lut_offsets (clk, en,addr, dout);
    input  clk;
    input  en;
    input  [8:0] addr;
    output [38:0] dout;
(*rom_style = "block" *)     reg    [38:0] ram [383:0];
    reg    [38:0] dout;
    always @(posedge clk)
    begin
	if (en)
	 begin
            dout <= ram[addr];
     end
    end
    
endmodule
*/
