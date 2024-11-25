module signal(

	input clk,							//clock signal
	//nput [13:0] wave_counting,	//cantidad de ondas
	input [13:0] cont_in_inc,				//conteo del incrementador
	input [13:0] cont_in_dec,				//conteo del decrementador
	input [9:0] input_signal,		//señal de entrada
	input en_dec,						//entrada de los enable decrementador
	input en_inc,						//entrada de los enable incrementador
	//output reg reset_contador,
	output reg modo_signal,			//modo de la señal(positivo o negativo)
	output reg SPWM_1,				//salida 1
	output reg SPWM_2,				//salida 2
	//output modo
	output reg[16:0] bits_maximo,	//cantidad_datos
	output reg[16:0] contador,		//divisiones
	input wire[16:0] resultado_division, //resultado_division
	input [16:0] res_inc,
	input [16:0] res_dec
);

reg [9:0] resultado;
reg [9:0] conteo;
reg [9:0] limite;


initial begin
//	bits_maximo <= 1023/5;
limite = 1023 / 5;
end

always @(*) begin

	if(input_signal < 1)begin		//<1
//			contador <= contador + 1;
//			conteo <= contador;
//			resultado <= resultado + limite;
//			conteo <= 1023 - resultado;
			conteo <= conteo + limite;
	end

end

always @(posedge clk)begin

//	SPWM_1 <= en_dec;		//Veemos que si genera los pulsos de acuerdo al sentido de la onda
//	SPWM_2 <= en_inc;

	if(en_inc == 1'b1 && en_dec == 1'b0)begin

		SPWM_2 <= 1'b0;
		//contador <= 0;
		//SPWM_2 <= 1'b0;
	
//		SPWM_1 <= 1'b1;
//		SPWM_2 <= ~SPWM_1;

		//Modulo para detectar mayor o menor
//		if(input_signal < 10)begin
//			SPWM_1 <= 1'b1;
//		end else begin
//			SPWM_1 <= ~SPWM_1;
//			SPWM_1 <= 1'b0;
//		end

		//Modulo contador
//		if(input_signal < 1)begin
//			contador <= contador + 205;
//		end 
//		
		if(input_signal <= conteo && input_signal < 1023)begin
			SPWM_1 <= 1'b1;
		end else begin
			//SPWM_1 <= ~SPWM_1;
			//SPWM_1 <= ~SPWM_1;
			SPWM_1 <= 1'b0;
		end
			
	
	end else if(en_inc == 1'b0 && en_dec == 1'b1)begin
		contador <= 0;
		SPWM_1 <= 1'b0;
		
		if(input_signal >= conteo)begin
			SPWM_2 <= 1'b1;
		end else begin
			//SPWM_1 <= ~SPWM_1;
			//SPWM_1 <= ~SPWM_1;
			SPWM_2 <= 1'b0;
		end
		
//		SPWM_2 <= 1'b1;
//		SPWM_1 <= ~SPWM_2;
	
	end

end

//end 
endmodule