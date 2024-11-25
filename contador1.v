module contador1(
	input clk,						//Senalde reloj
	input [14:0] cnt_inc,		//Entrada de la salida del incrementador
	input [14:0] cnt_dec,		//Entrada de la salida del decrementador
	output reg en_inc,			//salida del enable del incrementador
	output reg en_dec,			//salida del enable del incrementador
	output reg[14:0] salida,		//Salida de nuestra partida SPWM
	output reg[13:0]cont_in_inc,	//Salida del conteo de incrementos
	output reg[13:0]cont_in_dec	//Salida del conteo de decrementos
);



//reg [11:0]cont_in_inc;
//reg [11:0]cont_in_dec;

//reg blink;
reg[10:0] contador;

initial begin
	en_inc = 1'b1;
	en_dec = 1'b0;
end

always @(posedge clk) begin
	
	if(cnt_inc == 15358 && (en_inc == 1'b1 && en_dec == 1'b0))begin
	
	contador <= contador + 1;
	
		if(contador == 1)begin
	
			cont_in_inc = cont_in_inc + 1;
			cont_in_dec = 0;
			
			/*
			en_inc = 1'b1;
			en_dec = 1'b0;
			cont_in_dec = 0;
			*/
			//-----
				contador <= 0;
			//-----
		
			if(cont_in_inc == 5)begin
			
				//en_inc = 1'b0;
				//en_dec = 1'b1;
				
				en_dec = 1'b1;
				en_inc = ~en_dec;
				cont_in_inc = 0;
			end
			
		end
		
	end else begin
	
		//salida = cnt_inc;
		
		if(en_inc == 1'b0 && en_dec == 1'b1)begin
			salida <= cnt_dec;
		end else begin
			salida <= cnt_inc;
		end
		
	end
	
	
	
	if(cnt_dec == 0 && (en_inc == 1'b0 && en_dec == 1'b1))begin
	
	contador <= contador + 1;
	
		if(contador == 1)begin
	
			cont_in_dec = cont_in_dec + 1;
			cont_in_inc = 0;
			/*
			en_inc = 1'b0;
			en_dec = 1'b1;
			cont_in_dec = 0;
			*/
			//-----
				contador <= 0;
			//-----
		
		
			if(cont_in_dec == 5)begin	//Originalmente cont_in_dec > 7		
			
				//en_inc = 1'b1;
				//en_dec = 1'b0;
				
				en_inc = 1'b1;
				en_dec = ~en_inc;
				
				cont_in_dec = 0;
			
			end
		
		end	
		
	end else begin
	
		
		if(en_inc == 1'b1 && en_dec == 1'b0)begin
			salida <= cnt_inc;
		end else begin
			salida <= cnt_dec;
		end
		
	end
	
	
end


endmodule