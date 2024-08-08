module mx2_4bits(y, d0, d1, s);		//4bit 2-to-1 mux
	input[3:0] d0, d1;
	input s;
	output[3:0] y;
	
	mx2 U0_mx2(y[0], d0[0], d1[0], s);		//LSB 2-to-1 MUX
	mx2 U1_mx2(y[1], d0[1], d1[1], s);		//Second bit 2-to-1 MUX
	mx2 U2_mx2(y[2], d0[2], d1[2], s);		//Third bit 2-to-1 MUX
	mx2 U3_mx2(y[3], d0[3], d1[3], s);		//MSB 2-to-1 MUX
endmodule
