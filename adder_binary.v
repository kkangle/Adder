module adder_binary(A,B,C,D,E,F,clk,result);

	input [15:0] A,B,C,D,E,F;
	input clk;
	output[15:0] result;
	
	wire [15:0] sum1, sum2, sum3, sum4, sum5, sum6;
	reg [15:0] sumreg1,sumreg2,sumreg3,sumreg4,sumreg5, sumreg6;
	
	assign sum1 = A + B;
	assign sum2 = C + D;
	assign sum3 = E + F;
	
	always@ (posedge clk)
		begin 
			sumreg1 <= sum1;
			sumreg2 <= sum2;
			sumreg3 <= sum3;
			sumreg4 <= sum4;
			sumreg5 <= sum5;
		end
		
	assign sum4 = sumreg1 + sumreg2;
	assign sum5 = sumreg4 + sumreg3;
	assign result = sumreg5;

endmodule