`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:46 08/20/2016 
// Design Name: 
// Module Name:    Instanciacion_Proyecto_I 
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
module Instanciacion_Proyecto_I(input wire clk, reset, sw1,sw2,sw3,btn,output wire v_sync, h_sync,output wire [2:0] rgb_out
    );
	 wire [2:0]RGB,graph_rgb;
	 wire vsync,hsync;
	 wire [9:0]pixel_x,pixel_y;
RGB_IN instance_name1 ( .clk(clk),  .clr(reset),  .sw1(sw1),  .sw2(sw2),  .sw3(sw3), 
								.btn(btn), .RGB(RGB));
sincronizacion instance_name2 (  .clk(clk),  .reset(reset),  .hsync(hsync),  .vsync(vsync),  .video_on(video_on),
											.p_tick(),  .pixel_x(pixel_x), .pixel_y(pixel_y));
ROM_LETRAS instance_name3 ( .color(RGB), .video_on(video_on), .pix_x(pixel_x), .pix_y(pixel_y), 
							.graph_rgb(graph_rgb) );

assign v_sync = vsync;
assign h_sync = hsync;
assign rgb_out= graph_rgb;

endmodule
