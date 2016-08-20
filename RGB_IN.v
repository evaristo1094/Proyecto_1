`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:07 08/18/2016 
// Design Name: 
// Module Name:    RGB_IN 
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
module RGB_IN(input wire clk, clr, sw1, sw2, sw3, btn, output wire [2:0]RGB
    );//declaracion de variables de entrada y salida


reg  delay1;       //Declaramos la conexion auxiliar tipo reg delay1
reg  delay2;       //Declaramos la conexion auxiliar tipo reg delay2
reg  delay3;       //Declaramos la conexion auxiliar tipo reg delay3
reg  delay4;       //Declaramos la conexion auxiliar tipo reg delay4
reg [2:0]RGB_reg;  // se declara un registro temporal para la se;al de salida RGB
reg [2:0]RGB_w;
//inicio en el flanco positivo del reloj
always @(posedge clk) 
  //se inicializan todos los registros a utilizar
  if(clr) begin        //Si se activa clr
      delay1<=0;        
      delay2<=0;        
      delay3<=0;        
		delay4<=0; 
		RGB_reg<=0;	
	end
	 //se realiza un tipo registro de desplazamiento para eliminar el rebote del boton
   else begin           //De lo contrario
      delay1<=btn;     
      delay2<=delay1;  
      delay3<=delay2;   
		delay4<=delay3;
		RGB_reg<= RGB_w;
	end
	//tomamos los datos de los switch
	always @*
		if (delay4)		//tomamos la senal limpia del boton
			 RGB_w = {sw3,sw2,sw1} ; // asignamos al registro de RGB los valores dados por los switch
		else 
			RGB_w = RGB_reg; // sino sigue teniendo el mismo valor
	
	//asigna el valor del registro a la salida del circuito
	assign RGB = RGB_reg; 

endmodule
