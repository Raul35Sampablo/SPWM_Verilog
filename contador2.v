module contador2(

	input clk3,
	input rst,
	input wire[1:0] modo,
	output reg[16:0] selection,
	output reg[16:0] q_onda

);

//Seleccionamos el modo
//reg[3:0] modo = 4'b0000;
//reg[16:0] limite8 = 0;
//reg[16:0] limite16 = 0;
reg[16:0] i = 3839;
reg[10:0] n = 15359;


always @(posedge clk3 or posedge rst) begin

	case (modo)
	2'b00: begin
		if(rst)begin
			selection <= 3839;
			end else if (i == 0) begin
				selection <= 3839;
				n <= n + 1;
				q_onda <= n;
			end else begin
				i <= i - 1;
				selection <= i;
			end
	end

	2'b01: begin
		if(rst)begin
			selection <= 15359;
			end else if (i == 0) begin
				selection <= 15359;
				n <= n + 1;
				q_onda <= n;
			end else begin
				i <= i - 1;
				selection <= i;
			end
		end
	
	
	endcase
	
end
	


endmodule