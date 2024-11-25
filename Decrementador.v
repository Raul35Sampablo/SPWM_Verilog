module Decrementador(
	input clk,
	input en,
	//output reg[11:0] i,
	output reg[14:0] salida

);

//El en cuando esta en 1, se activa el contador
//Cuando esta en 0 se desactiva

reg[13:0]i;
reg[10:0] contador;

always @(posedge clk) begin
	/*
	if(i == 15358 || en == 1'b0) begin
		i<= 0;
	end else if (i < 15358) begin
		//i <= i + 1;						//<-- Original
		//salida <= 15358 - i;
		
		if(contador < 255)begin
			contador <= contador + 1;
		end else begin
			contador <= 0;
			i <= i + 1;
		end
		
		salida <= 1023 - i;
		
	end else begin
		i <= 0;
	end*/
	
	if(en == 1'b1 || i < 15359)begin
		contador <= contador + 1;
		
			if(contador > 1)begin
				i <= i + 1;
				salida <= 15358 - i;
				contador <= 0;
			end
		
	end else begin
		contador <= 0;
		i <= 0;	
	end
	
	
end


endmodule