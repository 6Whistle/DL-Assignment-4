module alu32(result, c, n, z, v, a, b, op);		//alu32
	input[31:0] a, b;
	input[2:0] op;
	output[31:0] result;
	output c, n, z, v;
	wire [31:0] w_add_b;
	wire [31:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_result;
	wire co_prev, co_add;
	
	_inv_32bits U0_inv_32bits(w_not_a, a);		//invert a
	_inv_32bits U1_inv_32bits(w_not_b, b);		//invert b
	_and2_32bits U2_and2_32bits(w_and, a, b);	//a * b
	_or2_32bits U3_or2_32bits(w_or, a, b);		//a + b
	_xor2_32bits U4_xor2_32bits(w_xor, a, b);	//a ^ b
	_xnor2_32bits U5_xnor2_32bits(w_xnor, a, b);		//~(a ^ b)
	mx2_32bits U6_mx2_32bits(w_add_b, b, w_not_b, op[0]);		//adder and subtracter
	cla32 U7_cla32(w_add, co_add, co_prev, a, w_add_b, op[0]);		//select adder's input(b or ~b)
	mx8_32bits U9_mx8_32bits(result, w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_add, op[2], op[1], op[0]);		//select data using 8-to-1 MUX(32bits)
	
	cla_flags32 U10_cla_flag32(c, n, z, v, op, result, co_add, co_prev);		//print c, n, z, v
	
endmodule
	