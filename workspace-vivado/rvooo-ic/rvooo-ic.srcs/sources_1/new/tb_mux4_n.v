`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 07:03:13 PM
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


module tb_mux4_n();

    reg [`N_BIT_MUX-1:0] data_in0_s, data_in1_s, data_in2_s, data_in3_s;
    reg [1:0] sel_s;
    wire [`N_BIT_MUX-1:0] data_out_s;

    mux4_n #(
        .N_BIT(`N_BIT_MUX)
    ) dut (
        .data_in0(data_in0_s),
        .data_in1(data_in1_s),
        .data_in2(data_in2_s),
        .data_in3(data_in3_s),
        .sel(sel_s),
        .data_out(data_out_s)
    );
    
    
    initial begin
        data_in0_s <= 32'h00000017;
        data_in1_s <= 32'h00000013;
        data_in2_s <= 32'h00000054;
        data_in3_s <= 32'h00000042;
        sel_s <= 00;  // 17
        #10;
        sel_s <= 01;  // 13
        #10;
        sel_s <= 10;  // 54
        #10;
        sel_s <= 11;  // 42
    end 
endmodule
