`timescale 1ns / 1ps
`include "constants.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 03:14:45 PM
// Design Name: 
// Module Name: mux2_n
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


module mux2_n #(
        parameter N_BIT = `N_BIT_MUX
    ) (
        data_in0,
        data_in1,
        data_out,
        sel
    );
    
    input [N_BIT-1:0] data_in0;  // sel = 0
    input [N_BIT-1:0] data_in1;  // sel = 1 
    input sel;
    output [N_BIT-1:0] data_out;
    
    reg [N_BIT-1:0] data_out;
    
    always @(*) begin
        if (sel == 0)
            data_out <= data_in0;
        else 
            data_out <= data_in1;
    end 
endmodule
