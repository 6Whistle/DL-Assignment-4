`timescale 1ns/100ps

module tb_alu32;		//self-checking testbench with testvectors
	reg[31:0] tb_a, tb_b;
	reg[2:0] tb_op;
	
	
	reg[35:0] resultexpected;			//store expected result and cnzv
	reg[31:0] vectornum, errors;		//count testvectors and errors
	reg[103:0] testvectors[31:0];		//Read data from example.tv
	reg dummp;								//to read op hex
	reg clk, reset;
	
	wire[31:0] tb_result;
	wire tb_c, tb_n, tb_z, tb_v;
	
	alu32 U0_alu32(tb_result, tb_c, tb_n, tb_z, tb_v, tb_a, tb_b, tb_op);
	

	always begin
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		$readmemh("./../../example.tv", testvectors);		//Read data and store at testvectors
		vectornum = 0; errors = 0; reset = 0;
	end
		
	always @ (posedge clk)	//every posedge, set data
	begin
		#1; {tb_a, tb_b, dummp, tb_op, resultexpected} = testvectors[vectornum];		//set data tb_a, tb_b, tb_op(1byte), resultexpected)
	end
	
	always @ (negedge clk)	//every negedge, virification itself
		if(~reset) begin
			if({tb_result, tb_c, tb_n, tb_z, tb_v} !== resultexpected) begin		//if result != result expected, print error and errors count
				$display("Error: a = %h, b = %h, op = %b", tb_a, tb_b, tb_op);
				$display("result = %h, cnzv = %b, (expected : %h)", tb_result, {tb_c, tb_n, tb_z, tb_v} ,resultexpected);
				errors = errors + 1;
			end
		
			vectornum = vectornum + 1;			//count++
			
			if(testvectors[vectornum] === 104'bx) begin			//if data is null, finish
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
		end
		
endmodule