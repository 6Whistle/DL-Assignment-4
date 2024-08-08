module alu4(result, c, n, z, v, a, b, op);		//alu4
	input[3:0] a, b;
	input[2:0] op;
	output[3:0] result;
	output c, n, z, v;
	wire [3:0] w_add_b;
	wire [3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_result;
	wire c3_add, co_add;
	
	_inv_4bits U0_inv_4bits(w_not_a, a);		//invert a
	_inv_4bits U1_inv_4bits(w_not_b, b);		//invert b
	_and2_4bits U2_and2_4bits(w_and, a, b);	//a * b
	_or2_4bits U3_or2_4bits(w_or, a, b);		//a + b
	_xor2_4bits U4_xor2_4bits(w_xor, a, b);	//a ^ b
	_xnor2_4bits U5_xnor2_4bits(w_xnor, a, b);		//~(a ^ b)
	mx2_4bits U6_mx2_4bits(w_add_b, b, w_not_b, op[0]);		//adder and subtracter
	cla4_ov U7_cla4_ov(w_add, co_add, c3_add, a, w_add_b, op[0]);		//select adder's input(b or ~b)
	mx8_4bits U9_mx8_4bits(result, w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_add, op[2], op[1], op[0]);		//select data using 8-to-1 MUX(4bits)
	
	cla_flags4 U10_cla_flag4(c, n, z, v, op, result, co_add, c3_add);		//print c, n, z, v
	
endmodule
	