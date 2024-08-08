module mx8_32bits(y, a, b, c, d, e, f, g, h, s2, s1, s0);		//32bit 8-to-1 mux
	input[31:0] a, b, c, d, e, f, g, h;
	input s2, s1, s0;
	output[31:0] y;
	wire[31:0] w0, w1, w2, w3, w4, w5;
	
	mx2_32bits U0_mx2_32bits(w0, a, b, s0);		//seleted by op s0
	mx2_32bits U1_mx2_32bits(w1, c, d, s0);		
	mx2_32bits U2_mx2_32bits(w2, e, f, s0);		
	mx2_32bits U3_mx2_32bits(w3, g, h, s0);		
	
	mx2_32bits U4_mx2_32bits(w4, w0, w1, s1);		//selected by op s1		
	mx2_32bits U5_mx2_32bits(w5, w2, w3, s1);		

	mx2_32bits U6_mx2_32bits(y, w4, w5, s2);		//selected by op s2
endmodule
