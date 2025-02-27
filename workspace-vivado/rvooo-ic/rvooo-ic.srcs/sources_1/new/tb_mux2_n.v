`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 03:18:17 PM
// Design Name: 
// Module Name: tb_mux2_n
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


module tb_mux2_n();

    reg [`N_BIT_MUX-1:0] data_in0_s, data_in1_s;
    reg sel_s;
    wire [`N_BIT_MUX-1:0] data_out_s;

    mux2_n #(
        .N_BIT(`N_BIT_MUX)
    ) dut (
        .data_in0(data_in0_s),
        .data_in1(data_in1_s),
        .sel(sel_s),
        .data_out(data_out_s)
    );
    
    
    initial begin
        data_in0_s <= 32'h00000017;
        data_in1_s <= 32'h00000013;
        sel_s <= 0;  // 17
        #10;
        sel_s <= 1;  // 13
    end 
endmodule
