module division(
input clk,
input wire[16:0] divisor,
input wire[16:0] dividendo,
output reg [16:0] resultado

);

//assign resultado = dividendo / (divisor);

always @(posedge clk)begin

	resultado <= dividendo / (divisor);
	
end

endmodule