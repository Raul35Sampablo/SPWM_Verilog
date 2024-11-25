module contador1(

	input clk,
	input rst,
	output reg[16:0] selection

);

//Seleccionamos el modo
reg[2:0] modo = 3'b00;
reg[16:0] i;
//reg[10:0] n;


always @(posedge clk or posedge rst) begin

	if(rst)begin
		selection <= 0;
		end else if (i == 15359) begin
			selection <= 0;
		end else begin
			i <= i + 1;
			selection <= i;
		end	
	end
	


endmodule