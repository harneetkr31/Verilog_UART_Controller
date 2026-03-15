`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2026 22:33:09
// Design Name: 
// Module Name: uart_top
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

module uart_top(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    output [7:0] data_out,
    output tx_done,
    output rx_done
);

wire baud_tick;
wire tx_line;

baud_gen baud(
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick)
);

uart_tx transmitter(
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .tx_start(start),
    .data_in(data_in),
    .tx(tx_line),
    .tx_done(tx_done)
);

uart_rx receiver(
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .rx(tx_line),
    .data_out(data_out),
    .rx_done(rx_done)
);

endmodule
