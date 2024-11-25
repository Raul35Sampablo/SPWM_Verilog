module multiplicacion(

	input [13:0] cont_in_inc,
	input [10:0] digito2_1,
	output [10:0] result_1_2,
	
	input [13:0] cont_in_dec,
	input [10:0] digito2_2,
	output [10:0] result_2_2

);

assign result_1_2 = cont_in_inc * digito2_1;
assign result_2_2 = (cont_in_dec - 3) * digito2_2;

endmodule