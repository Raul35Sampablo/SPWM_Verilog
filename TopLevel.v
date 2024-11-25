module TopLevel(
	input clk,
	output [9:0] output_data,
	output SPWM_1,
	output SPWM_2
);

wire [9:0] input_signal_top;
wire [13:0] q_onda_top;
wire [13:0] selectores;
wire modo;

//--------------------------------

wire en1;
wire en2;
wire[13:0] salida_inc;
wire[13:0] salida_dec;
wire[13:0] salida_contador_ic_dec;
wire[16:0] conteo_incrementos;
wire[16:0] conteo_decrementos;

//--------------------------------

//wire [16:0] divisor;
//wire [16:0] dividendo;
//wire [16:0] resultado;

//-------------------------------

//wire [16:0] res_inc;
//wire [16:0] res_dec;

//wire SPWM;
/*
mem2 inst_mem2(
	.clk(clk),
	.output_data_2(input_signal_top),
	.selector2(selectores)
);

signal inst_signal(
	.clk(clk),
	.q_onda(q_onda_top),
	.input_signal(input_signal_top),
	.modo_signal(modo),
	.SPWM_1(SPWM1),
	.SPWM_2(SPWM2)
);

contador1 inst_contador1(
	.clk(clk),
	.q_onda(q_onda_top),
	.selection(selectores),
	.modo(modo)
);
*/

signal inst_signal(
	.clk(clk),
	.input_signal(input_signal_top),
	//.wave_counting(salida_contador_ic_dec),
	.cont_in_inc(conteo_incrementos),
	.cont_in_dec(conteo_decrementos),
	//.cnt_inc(salida_inc),
	//.cnt_dec(salida_dec),
	.en_dec(en2),
	.en_inc(en1),
	.bits_maximo(dividendo),
	.contador(divisor),
	.resultado_division(resultado),
	/*.en_dec(salida_dec),
	.en_inc(salida_inc),
	.salida(input_signal_top)*/
	.res_inc(res_inc),
	.res_dec(res_dec),
	.SPWM_1(SPWM_1),
	.SPWM_2(SPWM_2)

);

mem2 inst_mem2(
	.clk(clk),
	.output_data_2(input_signal_top),
	.selector2(salida_contador_ic_dec)
);

Incrementador inst_inc(
	.clk(clk),
	.en(en1),
	.i(salida_inc)
);

Decrementador inst_dec(
	.clk(clk),
	.en(en2),
	.salida(salida_dec)
);

contador1 inst_contador1(
	.clk(clk),
	.salida(salida_contador_ic_dec),
	.en_inc(en1),
	.en_dec(en2),
	.cnt_inc(salida_inc),
	.cnt_dec(salida_dec),
	.cont_in_inc(conteo_incrementos),
	.cont_in_dec(conteo_decrementos)
);

/*
division inst_division(
	.clk(clk),
	.divisor(divisor),
	.dividendo(dividendo),
	.resultado(resultado)

);
*/

/*
multiplicacion inst_multiplicacion(
	.cont_in_inc(conteo_incrementos),
	.digito2_1(resultado),
	.result_1_2(res_inc),
	.cont_in_dec(conteo_decrementos),
	.digito2_2(resultado),
	.result_2_2(res_dec),

);
*/

assign output_data = input_signal_top;
//assign SPWM = SPWM 

endmodule


