`timescale 1ns/1ps

module uart_tb;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire [7:0] data_out;
wire tx_done;
wire rx_done;

// Instantiate DUT (Device Under Test)
uart_top uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .data_out(data_out),
    .tx_done(tx_done),
    .rx_done(rx_done)
);

// Clock generation (10 ns period)
always #5 clk = ~clk;

initial
begin
    // Initial values
    clk = 0;
    rst = 1;
    start = 0;
    data_in = 8'hAA;   // 10101010

    // Release reset
    #20 rst = 0;

    // Start transmission
#20 start = 1;
#10 start = 0;

#20000000;

$stop;
end

endmodule