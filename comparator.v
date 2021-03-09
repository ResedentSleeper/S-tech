`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 05:25:59 AM
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
    
    wire n_b0, n_b1, n_b2, n_b3;
    wire a_bigger0, a_bigger1, a_bigger2, a_bigger3;      
    wire equals0, equals1, equals2, equals3;    
  
    not(n_b0, b0);
    not(n_b1, b1);
    not(n_b2, b2);
    not(n_b3, b3);

    //equals
    xnor(equals0, a0, b0);
    xnor(equals1, a1, b1);
    xnor(equals2, a2, b2);
    xnor(equals3, a3, b3);

    and(equals, equals0, equals1, equals2, equals3);
    
    //a_bigger
    and(a_bigger3, n_b3, a3);
    and(a_bigger2, n_b2, a2, equals3);
    and(a_bigger1, n_b1, a1, equals3, equals2);
    and(a_bigger0, n_b0, a0, equals3, equals2, equals1);
    
    or(a_bigger, a_bigger0, a_bigger1, a_bigger2, a_bigger3);
    
    //b_bigger
    nor(b_bigger, equals, a_bigger);

endmodule
