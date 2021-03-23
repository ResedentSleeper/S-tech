`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2021 05:33:54 AM
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
    reg [3:0] A;
    reg [3:0] B;
    wire a_bigger_out, b_bigger_out, equals_out ;
    
    comparator comp(
        .a0(A[0]),
        .a1(A[1]),
        .a2(A[2]),
        .a3(A[3]),
        .b0(B[0]),
        .b1(B[1]),
        .b2(B[2]),
        .b3(B[3]),
        .a_bigger(a_bigger_out),
        .b_bigger(b_bigger_out),
        .equals(equals_out)
    );
    
    integer i;
    reg [7:0] test_val;
    reg expected_val_a_bigger;
    reg expected_val_b_bigger;
    reg expected_val_equals;
    
    initial begin
        for (i=0;i<64;i=i+1) begin
            test_val=i;
            A=test_val[7:4];
            B=test_val[3:0]; 
            expected_val_a_bigger=A>B;
            expected_val_b_bigger=A<B;
            expected_val_equals=A==B;
            #10 
            if (a_bigger_out==expected_val_a_bigger && b_bigger_out==expected_val_b_bigger && equals_out==expected_val_equals) begin
                $display("The comparator output is correct. A=%b, B=%b, a_bigger_out=%b,b_bigger_out=%b,equals_out=%b",A,B,a_bigger_out,b_bigger_out,equals_out);
            end else begin
                $display("The comparator output is wrong. A=%b, B=%b, a_bigger_out=%b,b_bigger_out=%b,equals_out=%b",A,B,a_bigger_out,b_bigger_out,equals_out);
            end
         end
      #10 $stop;
    end 
endmodule
