`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 11:41:19 PM
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator(
    input a0, 
    input a1,
    input a2,
    input a3,
    input b0, 
    input b1,
    input b2,
    input b3,
      
    output a_bigger,
    output b_bigger,
    output equals
    );
    
    wire n_a0, n_a1, n_a2, n_a3;
    wire n_b0, n_b1, n_b2, n_b3;
    wire a_bigger0, a_bigger1, a_bigger2, a_bigger3;   
    wire b_bigger0, b_bigger1, b_bigger2, b_bigger3;     
    wire equals0, equals1, equals2, equals3;    
    
  
    
    nand(n_a0, a0, a0);
    nand(n_a1, a1, a1);
    nand(n_a2, a2, a2);
    nand(n_a3, a3, a3);
    
    nand(n_b0, b0, b0);
    nand(n_b1, b1, b1);
    nand(n_b2, b2, b2);
    nand(n_b3, b3, b3);

    xnor(equals0, a0, b0);
    xnor(equals1, a1, b1);
    xnor(equals2, a2, b2);
    xnor(equals3, a3, b3);
    
    and(equals, equals0, equals1, equals2,equals3);
    
    and(a_bigger3, n_b3, a3);
    and(a_bigger2, n_b2, a2);
    and(a_bigger1, n_b1, a1);
    and(a_bigger0, n_b0, a0);
    
    or(a_bigger, a_bigger0, a_bigger1, a_bigger2, a_bigger3);
    
    and(b_bigger3, n_a3, b3);
    and(b_bigger2, n_a2, b2);
    and(b_bigger1, n_a1, b1);
    and(b_bigger0, n_a0, b0);  
   
    or(b_bigger, b_bigger0, b_bigger1, b_bigger2, b_bigger3);
   
   
endmodule
