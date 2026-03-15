`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 16:04:49
// Design Name: 
// Module Name: baud_gen
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


module baud_gen(
    input clk,
    input rst,
    output reg baud_tick
);

parameter BAUD_DIV = 5;
reg [12:0] counter;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        counter <= 0;
        baud_tick <= 0;
    end
    else
    begin
        if(counter == BAUD_DIV-1)
        begin
            counter <= 0;
            baud_tick <= 1;
        end
        else
        begin
            counter <= counter + 1;
            baud_tick <= 0;
        end
    end
end

endmodule
