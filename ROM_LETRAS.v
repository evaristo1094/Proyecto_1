`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:06 08/18/2016 
// Design Name:    RICARDO UMAÑA SANTAMARIA
// Module Name:    rom 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ROM_LETRAS(input wire [2:0] color,
    input wire video_on,
    input wire [9:0] pix_x, pix_y,
    output reg [2:0] graph_rgb
   );

   // constant and signal declaration
   // x, y coordinates (0,0) to (639,479)
   localparam MAX_X = 640;
   localparam MAX_Y = 480;
	//haciendo cuadros 16x16 #1 LUIS
	localparam LETTER_SIZE = 16;
   localparam LETTER_X_L = 500;
   localparam LETTER_X_R = LETTER_X_L+LETTER_SIZE-1;
	localparam LETTER_Y_T = 238;
   localparam LETTER_Y_B = LETTER_Y_T+LETTER_SIZE-1;
	//#2 EVARISTO
   localparam LETTER_X_LE = 400;
   localparam LETTER_X_RE= LETTER_X_LE+LETTER_SIZE-1;
	localparam LETTER_Y_TE = 238;
   localparam LETTER_Y_BE = LETTER_Y_TE+LETTER_SIZE-1;
	//#3 RICARDO
	localparam LETTER_X_LR = 300;
   localparam LETTER_X_RR= LETTER_X_LR+LETTER_SIZE-1;
	localparam LETTER_Y_TR = 238;
   localparam LETTER_Y_BR = LETTER_Y_TR+LETTER_SIZE-1;
   //--------------------------------------------
   // object output signals
   //--------------------------------------------
   wire sq_letter_onL, sq_letter_onR, sq_letter_onE;
   wire [3:0] rom_addrL, rom_col, rom_addrE, rom_addrR, rom_colE, rom_colR;
   reg [15:0] rom_data, rom_dataR, rom_dataE;
   wire rom_bit, rom_bitE, rom_bitR;
   //ROM LUIS
	 always @*
   case (rom_addrL)
      4'h0: rom_data = 16'b1111000000000000; // ****
      4'h1: rom_data = 16'b1111000000000000; // ****
      4'h2: rom_data = 16'b1111000000000000; // ****
      4'h3: rom_data = 16'b1111000000000000; // ****
      4'h4: rom_data = 16'b1111000000000000; // ****
      4'h5: rom_data = 16'b1111000000000000; // ****
      4'h6: rom_data = 16'b1111000000000000; // ****
      4'h7: rom_data = 16'b1111000000000000; // ****
		4'h8: rom_data = 16'b1111000000000000; // ****
		4'h9: rom_data = 16'b1111000000000000; // ****
		4'hA: rom_data = 16'b1111000000000000; // ****
		4'hB: rom_data = 16'b1111000000000000; // ****
		4'hC: rom_data = 16'b1111000000000000; // ****
		4'hD: rom_data = 16'b1111111111111100; // **************
		4'hE: rom_data = 16'b1111111111111100; // **************
		4'hF: rom_data = 16'b1111111111111100; // **************
   endcase

 // pixel within ball
   assign sq_letter_onL =
            (LETTER_X_L<=pix_x) && (pix_x<=LETTER_X_R) &&
            (LETTER_Y_T<=pix_y) && (pix_y<=LETTER_Y_B);
   // map current pixel location to ROM addr/col
   assign rom_addrL = pix_y[3:0] - LETTER_Y_T[3:0];
   assign rom_col =  LETTER_X_R[3:0] - pix_x[3:0] ;
   assign rom_bit = rom_data[rom_col];
   // pixel within ball
   assign rd_letter_on = sq_letter_onL & rom_bit;
	//-----------------------------------------------------
	//ROM EVARISTO
	 always @*
   case (rom_addrE)
      4'h0: rom_dataE = 16'b1111111111111111; // **************
      4'h1: rom_dataE = 16'b1111111111111111; // **************
      4'h2: rom_dataE = 16'b1111111111111111; // **************
      4'h3: rom_dataE = 16'b1111000000000000; // ****
      4'h4: rom_dataE = 16'b1111000000000000; // ****
      4'h5: rom_dataE = 16'b1111000000000000; // ****
      4'h6: rom_dataE = 16'b1111000000000000; // ****
      4'h7: rom_dataE = 16'b1111111111110000; // ************
		4'h8: rom_dataE = 16'b1111111111110000; // ************
		4'h9: rom_dataE = 16'b1111000000000000; // ****
		4'hA: rom_dataE = 16'b1111000000000000; // ****
		4'hB: rom_dataE = 16'b1111000000000000; // ****
		4'hC: rom_dataE = 16'b1111000000000000; // ****
		4'hD: rom_dataE = 16'b1111111111111111; // **************
		4'hE: rom_dataE = 16'b1111111111111111; // **************
		4'hF: rom_dataE = 16'b1111111111111111; // **************
   endcase

 // pixel within ball
   assign sq_letter_onE =
            (LETTER_X_LE<=pix_x) && (pix_x<=LETTER_X_RE) &&
            (LETTER_Y_TE<=pix_y) && (pix_y<=LETTER_Y_BE);
   // map current pixel location to ROM addr/col
   assign rom_addrE = pix_y[3:0] - LETTER_Y_TE[3:0];
   assign rom_colE = LETTER_X_RE[3:0] - pix_x[3:0] ;
   assign rom_bitE = rom_dataE[rom_colE];
   // pixel within ball
   assign rd_letter_onE = sq_letter_onE & rom_bitE;
	//------------------------------------------------------
	//ROM RICARDO
	 always @*
   case (rom_addrR)
      4'h0: rom_dataR = 16'b1111111111000000; // **********
      4'h1: rom_dataR = 16'b1111111111100000; // ***********
      4'h2: rom_dataR = 16'b1111111111110000; // ************
      4'h3: rom_dataR = 16'b1111000000111000; // ****       ***
      4'h4: rom_dataR = 16'b1111000000111000; // ****       ***
      4'h5: rom_dataR = 16'b1111000000111000; // ****       ***
      4'h6: rom_dataR = 16'b1111000000111000; // ****       ***
      4'h7: rom_dataR = 16'b1111111111110000; // *************
		4'h8: rom_dataR = 16'b1111111111100000; // ************
		4'h9: rom_dataR = 16'b1111000111000000; // ****   ***
		4'hA: rom_dataR = 16'b1111000011100000; // ****    ***
		4'hB: rom_dataR = 16'b1111000001110000; // ****     ***
		4'hC: rom_dataR = 16'b1111000000111000; // ****      ***
		4'hD: rom_dataR = 16'b1111000000011100; // ****       ***
		4'hE: rom_dataR = 16'b1111000000001110; // ****        ***
		4'hF: rom_dataR = 16'b1111000000000111; // ****         ***
   endcase

 // pixel within ball
   assign sq_letter_onR =
            (LETTER_X_LR<=pix_x) && (pix_x<=LETTER_X_RR) &&
            (LETTER_Y_TR<=pix_y) && (pix_y<=LETTER_Y_BR);
   // map current pixel location to ROM addr/col
   assign rom_addrR = pix_y[3:0] - LETTER_Y_TR[3:0];
   assign rom_colR = LETTER_X_RR[3:0]  - pix_x[3:0] ;
   assign rom_bitR = rom_dataR[rom_colR];
   // pixel within ball
   assign rd_letter_onR = sq_letter_onR & rom_bitR;
   // rgb multiplexing circuit
 //----------------------------------------------------
   always @*
      if (~video_on)
         graph_rgb = 3'b000; // blank
      else
         if (rd_letter_on)
            graph_rgb = color;
         else if (rd_letter_onE)
            graph_rgb = color;
         else if (rd_letter_onR)
            graph_rgb = color;
         else
            graph_rgb = 3'b000; // black background

endmodule
