module adder_recursive_tb();
  reg clk;
  wire [15:0] sum;
   
  adder_recursive #(5,16) adder_recursive (clk,{16'h0001, 16'h0002, 16'h0003, 16'h0004, 16'h0005},sum);
initial
  begin
  #100
  if (sum != 16'h000F)
     $display("FAILED: got %d",sum);
  else
     $display("PASSED");
  $stop();
end

// clock
initial
  clk = 0;
always #5 clk = ~clk;
endmodule
   
