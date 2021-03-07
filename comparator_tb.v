`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 12:31:05 AM
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb;

    reg a0_in, a1_in, a2_in, a3_in, b0_in, b1_in, b2_in, b3_in ;
    wire a_bigger_out, b_bigger_out, equals_out ;
    
    comparator comp(
        .a0(a0_in),
        .a1(a1_in),
        .a2(a2_in),
        .a3(a3_in),
        .b0(b0_in),
        .b1(b1_in),
        .b2(b2_in),
        .b3(b3_in),
        .a_bigger(a_bigger_out),
        .b_bigger(b_bigger_out),
        .equals(equals_out)
    );
    
    initial begin 
    
        a0_in = 1;
        a1_in = 0;
        a2_in = 0;
        a3_in = 1;
        
        b0_in = 1;
        b1_in = 0;
        b2_in = 0;
        b3_in = 1;
       
      #10 $stop;
    end 

endmodule
