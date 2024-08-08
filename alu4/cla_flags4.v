module cla_flags4(c, n, z, v, op, result, co_add, c3_add);		//print c, n, z, v
	input[2:0] op;
	input[3:0] result;
	input co_add, c3_add;
	output c, n, z, v;
	
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;		//c = co(when add execute)
	assign n = result[3];										//n = result[3](sign)
	assign z = (result == 4'b0) ? 1'b1 : 1'b0;			//z == true(when all input is 0)
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ c3_add;	//v = co ^ c3(when add execute)	
endmodule
