`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:40:45 08/21/2016
// Design Name:   Instanciacion_Proyecto_I
// Module Name:   C:/Users/Evaristo/Documents/Verilog/Proyecto_VGA_Letras/test-bench_proyecto1.v
// Project Name:  Proyecto_VGA_Letras
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instanciacion_Proyecto_I
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_proyecto1;

	// Inputs
	reg clk;
	reg reset;
	reg sw1;
	reg sw2;
	reg sw3;
	reg btn;
	
	// Outputs
	wire v_sync;
	wire h_sync;
	wire [2:0] rgb_out;
	

	// Instantiate the Unit Under Test (UUT)
	Instanciacion_Proyecto_I uut (
		.clk(clk), 
		.reset(reset), 
		.sw1(sw1), 
		.sw2(sw2), 
		.sw3(sw3), 
		.btn(btn), 
		.v_sync(v_sync), 
		.h_sync(h_sync), 
		.rgb_out(rgb_out)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		sw1 = 0;
		sw2 = 0;
		sw3 = 0;
		btn = 0;
		clk=0;
		// Wait 100 ns for global reset to finish
		#100;
        
			// se hace un clear inicial a todas las senales
      reset = 1; 
		#100;
		reset = 0;
		#100; 
		//se da un valor a la senal de control de colores.
		sw1 = 1;
		sw2 = 0;
		sw3 = 1;
		#100;
		// se activa el boton que indica al circuito que tome la senal ingreada por los switch
		btn = 1;
		#100;
		btn = 0;
		#200;
		//se da un nuevo valor a la senal de control de colores pero la salida RGB no cambia porque el btn no ha sido pulsado
		sw1 = 0;
		sw2 = 0;
		sw3 = 1;
		#200;
		//se da un nuevo valor a la senal de control de colores y se acciona el boton.
		sw1 = 0;
		sw2 = 0;
		sw3 = 1;
		#200;
		btn = 1;
		#100;
		btn = 0;		
		#100;
		sw1 = 0;
		sw2 = 1;
		sw3 = 0;
		btn = 1;
		#100;
		btn = 0;
	end
		
	//generacion de CLK de 50MHz
      always  begin
		#10	clk = ~clk;
		end 
endmodule


