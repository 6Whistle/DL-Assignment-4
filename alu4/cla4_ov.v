module cla4_ov(s, co, c3, a, b, ci);
	input [3:0] a, b;
	input ci;
	output [3:0] s;
	output co;
	output c3;
	
	wire [2:0] c;
	
	fa_v2 U0_fa	(s[0], a[0], b[0], ci);			//LSB ADD
	fa_v2 U1_fa	(s[1], a[1], b[1], c[0]);		//Second bit ADD
	fa_v2 U2_fa	(s[2], a[2], b[2], c[1]);		//Third bit ADD
	fa_v2 U3_fa	(s[3], a[3], b[3], c[2]);		//MSB ADD
	clb4 U4_clb4 (c[0], c[1], c[2], co, a, b, ci);	//Carry Look-ahead Block
	
	assign c3 = c[2];
	
endmodule 