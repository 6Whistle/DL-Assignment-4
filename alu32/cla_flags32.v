module cla_flags32(c, n, z, v, op, result, co_add, co_prev);		//print c, n, z, v
	input[2:0] op;
	input[31:0] result;
	input co_add, co_prev;
	output c, n, z, v;
	
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add;		//c = co(when add execute)
	assign n = result[31];										//n = result[31](sign)
	assign z = (result == 32'b0) ? 1'b1 : 1'b0;			//z == true(when all input is 0)
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ co_prev;	//v = co ^ co_prev(when add execute)	
endmodule
