`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 02:32:11 PM
// Design Name: 
// Module Name: cube
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


module cube (
  input clk_i,
  input rst_i,
  input [7:0] x_bi,
  input start_i,
  output [1:0] busy_o,
  output reg [23:0] y_bo 
);
  localparam IDLE = 2'b00;
  localparam FIRST_WORK = 2'b01;
  localparam SECOND_WORK = 2'b10;
  reg [15:0] a;
  reg [7:0] b;
  wire [23:0] result;
  wire mult_busy;
  reg[ [1:0] state;
  reg start;
  
  assign busy_o=state;
  
  mult multiple(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .a_bi(a),
    .b_bi(b),
    .start_i(start),
    .busy_o(mult_busy),
    .y_bo(result)
  );
  
  always @(posedge clk_i)
    if (rst_i) begin
      y_bo <= 0;
      state <= IDLE;
    end else begin
      case (state)
		IDLE:
			if (start_i) begin
				if (x_bi==0) begin
					y_bo <= 0;
				end else begin
					state <= WORK;
					a <= {8'b0,x_bi};
					b <= x_bi;
					start <= 1;
				end
			end
	  endcase
    end
  always @(result) 
    begin
        start <= 0;
        case (state)
            WORK:
                begin
                    state <= MULT_WORK;
                    a <= result[15:0];
                    start <= 1;
                end  
            MULT_WORK:
                begin
                    state <= IDLE;
                    y_bo <= result;
                end    
        endcase
    end    
endmodule
