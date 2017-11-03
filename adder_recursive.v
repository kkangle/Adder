module adder_recursive(clk, add, sum);

parameter n = 4;
parameter width = 8;

input clk;
input [n * width - 1:0]add;
output reg [$clog2(n) + width - 1:0] sum;

generate

  // base case
  if(n == 1)
	always @(*) sum = add;
  else begin
        // first half
	wire [$clog2(n/2) + width -1:0] a1;
        //second half
	wire [$clog2(n-n/2) + width -1:0] a2;
        // instanciate
	sum_recursive#(n/2, width) sum0 (clk, add[(n/2)*width - 1:0], a1);
	sum_recursive#(n-n/2, width) sum1 (clk, add[n*width - 1:(n/2)*width], a2);
        // flop for holding the value
	always@(posedge clk) sum <= a1 + a2;
  end
endgenerate


endmodule
