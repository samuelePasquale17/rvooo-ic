`timescale 1ns / 1ps
`include "constants.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 06:58:51 PM
// Design Name: 
// Module Name: mux4_n
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


module mux4_n #(
        parameter N_BIT = `N_BIT_MUX
    ) (
        data_in0,
        data_in1,
        data_in2,
        data_in3,
        data_out,
        sel
    );
    
    input [N_BIT-1:0] data_in0;  // sel = 00
    input [N_BIT-1:0] data_in1;  // sel = 01
    input [N_BIT-1:0] data_in2;  // sel = 10
    input [N_BIT-1:0] data_in3;  // sel = 11
    input [1:0] sel;
    output [N_BIT-1:0] data_out;
    
    reg [N_BIT-1:0] data_out;
    
    always @(*) begin
        if (sel == 2'b00)
            data_out <= data_in0;
        else if (sel == 2'b01)
            data_out <= data_in1;
        else if (sel == 2'b10)
            data_out <= data_in2;
        else
            data_out <= data_in3;
    end 
endmodule