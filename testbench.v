module testbench();
reg [127:0] plaintext,key;
reg clk,rst;
wire[127:0]ciphertext;
integer i;
aes a11(key, plaintext, ciphertext,clk, rst);
always #25 clk=~clk;
initial clk=1'b0;
initial
begin
 rst=1'b0;
plaintext=128'h00000000000000000000000000000000;
    key = 128'h0123456789abcdef123456789abcdef0;   
  for(i=0; i<50001; i=i+1) 
  begin
   #50  rst=1'b1;
  #550 plaintext=ciphertext;
 rst=1'b0;
 
  end
  #30000000 $finish;
end
endmodule