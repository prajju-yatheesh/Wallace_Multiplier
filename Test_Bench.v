module wallace_tb;
  
  reg [3:0] a;
  reg [3:0] b;
  
  wire [7:0] product;
  
  wallace_multiplier uut(.product(product),
                         .a(a),
                         .b(b));
  
  initial begin
  a = 4'b1101;
  b = 4'b1100;

  #10; // Wait for 10 time units to allow computation
  $display("a = %b, b = %b, Output = %b", a,b,product);
    #100;
    a = 4'b1101;
  b = 4'b1101;

  #10; // Wait for 10 time units to allow computation
  $display("a = %b, b = %b, Output = %b", a,b,product);
    #100;
    a = 4'b1001;
  b = 4'b1100;

  #10; // Wait for 10 time units to allow computation
  $display("a = %b, b = %b, Output = %b", a,b,product);
    
end
endmodule

  
  
    
    
    
  
