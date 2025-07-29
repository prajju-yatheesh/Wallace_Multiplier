`timescale 1ns / 1ps

module wallace_multiplier(
  output [7:0] product,
  input [3:0] a,
  input [3:0] b
);

  wire [3:0][3:0] res;
  wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11;
  wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;

  // Partial Product Generation
  wire [3:0] row0 = a & {4{b[0]}};
  wire [3:0] row1 = a & {4{b[1]}};
  wire [3:0] row2 = a & {4{b[2]}};
  wire [3:0] row3 = a & {4{b[3]}};

  assign res[0] = row0;
  assign res[1] = row1;
  assign res[2] = row2;
  assign res[3] = row3;

  // Wallace Tree Adders
  half_adder h1(s0, c0, res[0][1], res[1][0]);
  full_adder f1(s1, c1, res[0][2], res[1][1], res[2][0]);
  full_adder f2(s2, c2, res[0][3], res[1][2], res[2][1]);
  full_adder f3(s3, c3, res[1][3], res[2][2], 1'b0);

  full_adder f4(s4, c4, s1, c0, 1'b0);
  full_adder f5(s5, c5, s2, c1, res[3][0]);
  full_adder f6(s6, c6, s3, c2, res[3][1]);
  full_adder f7(s7, c7, res[2][3], c3, res[3][2]);

  full_adder f8(s8, c8, s5, c4, 1'b0);
  full_adder f9(s9, c9, s6, c8, c5);
  full_adder f10(s10, c10, s7, c6, c9);
  full_adder f11(s11, c11, res[3][3], c7, c10);

  // Final product assignment
  assign product[0] = res[0][0];
  assign product[1] = s0;
  assign product[2] = s4;
  assign product[3] = s8;
  assign product[4] = s9;
  assign product[5] = s10;
  assign product[6] = s11;
  assign product[7] = c11;

endmodule

module half_adder(output sum, output carry, input a, input b);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

module full_adder(output sum, output carry, input a, input b, input cin);
  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

    

      
      

    

    

    

  
  
        
        
      