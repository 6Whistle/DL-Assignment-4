`timescale 1ns/100ps

module tb_alu4;		//self-checking testbench with testvectors
	reg[3:0] tb_a, tb_b;
	reg[2:0] tb_op;
	
	
	reg[7:0] resultexpected;			//store expected result and cnzv
	reg[31:0] vectornum, errors;		//count testvectors and errors
	reg[18:0] testvectors[30:0];		//Read data from example.tv
	reg clk, reset;
	
	wire[3:0] tb_result;
	wire tb_c, tb_n, tb_z, tb_v;
	
	alu4 U0_alu4(tb_result, tb_c, tb_n, tb_z, tb_v, tb_a, tb_b, tb_op);
	

	always begin
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		$readmemb("./../../example.tv", testvectors);		//Read data and store at testvectors
		vectornum = 0; errors = 0; reset = 0;
	end
		
	always @ (posedge clk)	//every posedge, set data
	begin
		#1; {tb_a, tb_b, tb_op, resultexpected} = testvectors[vectornum];		//set data (tb_a, tb_b, tb_op, resultexpected)
	end
	
	always @ (negedge clk)	//every negedge, virification itself
		if(~reset) begin
			if({tb_result, tb_c, tb_n, tb_z, tb_v} !== resultexpected) begin		//if result != result expected, print error and errors count
				$display("Error: a = %b, b = %b, op = %b", tb_a, tb_b, tb_op);
				$display("result = %b, cnzv = %b, (expected : %b)", tb_result, {tb_c, tb_n, tb_z, tb_v} ,resultexpected);
				errors = errors + 1;
			end
		
			vectornum = vectornum + 1;			//count++
			
			if(testvectors[vectornum] === 19'bx) begin			//if data is null, finish
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
		end
		
endmodule