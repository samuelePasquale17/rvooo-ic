`timescale 1ns / 1ps
`include "constants.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Illinois - Chicago
// Engineer: Samuele Pasquale
// 
// Create Date: 02/27/2025 09:14:41 AM
// Design Name: 
// Module Name: reg_n
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


module reg_n #(parameter WIDTH = `REG_WIDTH)(i, q, ld, pwr_on, clk, rst);

    input [WIDTH-1:0] i;    // input vector
    output [WIDTH-1:0] q;   // output vector
    input ld;                   // load control signal 
    input pwr_on;               // power control signal, 1 => On, 0 => Off
    input clk;                  // clock signal
    input rst;                  // reset signal
    
    reg [WIDTH-1:0] r;


    always @(posedge clk, pwr_on) begin  // synchronous reset
        if (rst == 1) 
            r <= {WIDTH{1'b0}};  // reset to zero
        else if (ld == 1)
            r <= i;  // load input vector
        
//////////////////////////////////////////////////////////////////////////////////
// intermittent power behavior simulation   
`ifdef INTERMITTENT_PWR_SIM
        if (pwr_on == 0)
            r <= {WIDTH{1'bx}};  // set to high impedance
`endif
//////////////////////////////////////////////////////////////////////////////////
    end 
    
    assign q = r; 
    
    
    
    

endmodule