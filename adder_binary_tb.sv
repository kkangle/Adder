module adder_binary_tb();

logic [15:0] A, B, C, D, E, F, result;
logic clk;
logic [15:0] compare;

adder_binary IDUT(.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .result(result), .clk(clk));

initial clk = 0;

initial begin
	A = 16'h0000;
	B = 16'h0001;
	C = 16'h0002;
	D = 16'h0003;
	E = 16'h0004;
	F = 16'h0005;

	assign compare = A + B + C + D + E + F;
	# 10

	if(result != compare) 
		$display("something is wrong\n");
	else 
		$display("passed");
end

always #5 clk = ~clk;

endmodule