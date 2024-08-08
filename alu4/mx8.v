module mx8(y, a, b, c, d, e, f, g, h, s2, s1, s0);		//8-to-1 mux
	input a, b, c, d, e, f, g, h;
	input s2, s1, s0;
	output y;
	
	wire w0, w1, w2, w3, w4, w5;

	mx2 U0_mx2(w0, a, b, s0);		//seleted by opcode s0
	mx2 U1_mx2(w1, c, d, s0);
	mx2 U2_mx2(w2, e, f, s0);
	mx2 U3_mx2(w3, g, h, s0);
	
	mx2 U4_mx2(w4, w0, w1, s1);		//selected by opcode s1
	mx2 U5_mx2(w5, w2, w3, s1);

	mx2 U6_mx2(y, w4, w5, s2);		//selected by opcode s2
endmodule
	