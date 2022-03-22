`timescale 1ns / 1ps

module generador_de_datos
(clk, sel_addr_dat, send, comando, dato, rst, data_in, data_out, reg_sel, wr);

   input clk, rst, send, sel_addr_dat;
   input [3:0] comando; // interruptores (bin)
   input [7:0] dato; // interruptores  
   input [31:0] data_in; // tomar [0] 
   output reg reg_sel;
   output reg wr;
   output reg [31:0] data_out;
   

   initial reg_sel=0;
   initial wr = 1'b0;
   initial data_out=8'b0;

	parameter RDY = 1'b0;

	parameter st_EsperandoSend = 3'b000;
	parameter st_EsperandoDebouncing = 3'b001;
	parameter st_RevisarRDY = 3'b010;
	parameter st_EscribirComando = 3'b011;
	parameter st_Reset = 3'b100;

	reg [2:0] estado = st_Reset;
	reg send_pasado = 1'b0;
	reg [31:0] contador = 31'b0;
	reg contador_estado = 1'b0;
	
	always @ ( posedge clk ) begin
		if ( rst == 1'b1 ) begin
			estado <= st_Reset;
		end
		else begin
			case (estado)

				st_EsperandoSend: begin
					if ( send == 1'b1 & send_pasado == 1'b0) begin
						send_pasado <= send;
						estado <= st_RevisarRDY;
					end
					else if ( send == 1'b0 & send_pasado == 1'b1) begin
						send_pasado <= send;
					end
				end

				st_EsperandoDebouncing: begin
					contador <= contador + 32'b1;
					wr <= 1'b0;
					if ( contador >= 20_000_000 // 2
					) begin
						estado <= st_EsperandoSend;
						contador <= 32'b0;
					end
				end

				st_RevisarRDY: begin
					if (data_in[RDY] == 1'b1) begin
						estado <= st_EscribirComando;	
					end
				end

				st_EscribirComando: begin
					if (contador_estado == 1'b0) begin
						contador_estado <= 1'b1;
					end
					else begin
						estado <= st_EsperandoDebouncing;
						contador_estado <= 1'b0;
					end
					case (comando)
						4'h0: begin //borrar display //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=4'h2;
						end
								
						4'hf: begin //borrar display y colocarlo en modo por defecto //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'hf2;
						end
								
						4'h1: begin //cursor en la esqina superior izq //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h12;
						end
								
						4'h2: begin //modo de entrada sin auto incremento //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h22;
						end
								
						4'h3: begin //modo de entrada incremental //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h32;
						end
						
						4'h4: begin //cursor fijo apagado //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h42;
						end
								
						4'h5: begin //cursor fijo encendido //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h52;
						end   
								
						4'h6: begin //cursor parpadeante //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h62;
						end   
						
						4'h7: begin //Escribir datos a la memoria DDRAM del display, sin cambiar direccion //0 control - 1 datos
							if (sel_addr_dat==0) begin
								reg_sel=1'b0;
								wr=1'b1;
								data_out=32'h72;
								data_out[15:8]=data_in[15:8];  
							end
							else begin
								reg_sel=1'b1;
								wr=1'b1;
								data_out=dato;
							end
						end   
								
						4'h8: begin//Escribir datos a la memoria DDRAM del display, usando la direccion colocada //0 control - 1 datos
							if (sel_addr_dat==0) begin
								reg_sel=1'b0;
								wr=1'b1;
								data_out=32'h82;
								data_out[15:8]=dato;
							end
							else begin
								reg_sel=1'b1;
								wr=1'b1;
								data_out=dato;	      
							end   
						end   
								
						4'h9: begin//Leer datos de la memoria DDRAM del display, sin cambiar direccion //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'h92;
							data_out[15:8]=data_in[15:8];  
						end   
								
						4'hA: begin//Leer datos de la memoria DDRAM del display, usando la direccion //0 control - 1 datos
							reg_sel=1'b0;
							wr=1'b1;
							data_out=32'hA2;
							data_out[15:8]=dato;    
						end						
					endcase
				end

				st_Reset: begin
					reg_sel = 1'b0;
					wr = 1'b1;
					data_out=32'hB2;
					
					if (contador_estado == 1'b0) begin
						contador_estado <= 1'b1;
					end
					else begin
						estado <= st_EsperandoDebouncing;
						contador_estado <= 1'b0;
					end
				end

			endcase
		end
	end
   
endmodule

