module _inv(y, a);		//NOT Gate
	input a;
	output y;
	
	assign y = ~a;
endmodule

module _nand2(y, a, b);		//2 input NAND Gate
	input a, b;
	output y;
	
	assign y = ~(a & b);
endmodule

module _and2(y, a, b);		//2 input AND Gate
	input a, b;
	output y;
	
	assign y = a & b;
endmodule

module _or2(y, a, b);		//2 input OR Gate
	input a, b;
	output y;
	
	assign y = a | b;
endmodule

module _xor2(y, a, b);		//2 input XOR Gate
	input a, b;
	output y;
	wire inv_a, inv_b;
	wire w0, w1;
	
	_inv invA(inv_a, a);		//invert a and b
	_inv invB(inv_b, b);
	
	_and2 and0(w0, inv_a, b);		//a'b
	_and2 and1(w1, a, inv_b);		//ab'
	
	_or2 or0(y, w0, w1);		//a'b + ab'
endmodule

module _and3(y, a, b, c);	//3 input AND Gate
	input a, b, c;
	output y;
	
	assign y = a & b & c;
endmodule

module _and4(y, a, b, c, d);	//4 input AND Gate
	input a, b, c, d;
	output y;
	
	assign y = a & b & c & d;
endmodule

module _and5(y, a, b, c, d, e);	//5 input AND Gate
	input a, b, c, d, e;
	output y;
	
	assign y = a & b & c & d & e;
endmodule

module _or3(y, a, b, c);	//3 input OR Gate
	input a, b, c;
	output y;
	
	assign y = a | b | c;
endmodule

module _or4(y, a, b, c, d);	//4 input OR Gate
	input a, b, c, d;
	output y;
	
	assign y = a | b | c | d;
endmodule

module _or5(y, a, b, c, d, e);	//5 input OR Gate
	input a, b, c, d, e;
	output y;
	
	assign y = a | b | c | d | e;
endmodule

module _inv_4bits(y, a);		//4bit inverter
	input[3:0] a;
	output[3:0] y;
	
	assign y = ~a;
endmodule

module _and2_4bits(y, a, b);	//4bit AND
	input[3:0] a, b;
	output[3:0] y;
	
	assign y = a & b;
endmodule

module _or2_4bits(y, a, b);	//4bit OR
	input[3:0] a, b;
	output[3:0] y;
	
	assign y = a | b;
endmodule

module _xor2_4bits(y, a, b);		//4bit XOR
	input[3:0] a, b;
	output[3:0] y;
	
	_xor2 U0_xor2(y[0], a[0], b[0]);
	_xor2 U1_xor2(y[1], a[1], b[1]);
	_xor2 U2_xor2(y[2], a[2], b[2]);
	_xor2 U3_xor2(y[3], a[3], b[3]);
endmodule

module _xnor2_4bits(y, a, b);		//4bit XNOR
	input[3:0] a, b;
	output[3:0] y;
	wire[3:0] w0;
	
	_xor2_4bits U0_xor2_4bits(w0, a, b);
	_inv_4bits U1_inv_4bits(y, w0);
endmodule
