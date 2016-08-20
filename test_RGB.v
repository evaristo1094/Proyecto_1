`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:47:04 08/18/2016
// Design Name:   RGB_IN
// Module Name:   C:/Users/Evaristo/Documents/Nueva carpeta/Proyecto_I/test_RGB.v
// Project Name:  Proyecto_I
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RGB_IN
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_RGB;

	// Inputs
	reg clk;
	reg clr;
	reg sw1;
	reg sw2;
	reg sw3;
	reg btn;

	// Outputs
	wire [2:0] RGB;

	// Instantiate the Unit Under Test (UUT)
	RGB_IN uut (
		.clk(clk), 
		.clr(clr), 
		.sw1(sw1), 
		.sw2(sw2), 
		.sw3(sw3), 
		.btn(btn), 
		.RGB(RGB)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		btn = 0;
		sw1 = 1;
		sw1 = 2;
		sw1 = 3;
		// Wait 100 ns for global reset to finish
		#300; 
      clr = 1;
		#100;
		clr = 0;
		#100; 
		sw1 = 1;
		sw2 = 0;
		sw3 = 1;
		#100;
		btn = 1;
		#100;
		btn = 0;
		#200;
		sw1 = 0;
		sw2 = 0;
		sw3 = 1;
		#200;
		sw1 = 0;
		sw2 = 0;
		sw3 = 1;
		#200;
		btn = 1;
		#100;
		btn = 0;
		#100;
		sw1 = 1;
		sw2 = 1;
		sw3 = 1;
		#100;
		sw1 = 1;
		sw2 = 0;
		sw3 = 0;
		#100;
		sw1 = 0;
		sw2 = 1;
		sw3 = 0;
		btn = 1;
		#100;
		btn = 0;
		// Add stimulus here

	end
       always  begin
		#10	clk = ~clk;
		end    
endmodule

