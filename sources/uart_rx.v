module uart_rx(
    input clk,
    input rst,
    input rx,
    input baud_tick,
    output reg [7:0] data_out,
    output reg rx_done
);

reg [3:0] bit_index;
reg [7:0] data_reg;
reg receiving;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        receiving <= 0;
        bit_index <= 0;
        rx_done <= 0;
    end
    else
    begin
        if(!receiving && rx == 0) // start bit detected
        begin
            receiving <= 1;
            bit_index <= 0;
        end
        else if(receiving && baud_tick)
        begin
            bit_index <= bit_index + 1;

            if(bit_index >= 1 && bit_index <= 8)
                data_reg[bit_index-1] <= rx;

            if(bit_index == 9)
            begin
                data_out <= data_reg;
                receiving <= 0;
                rx_done <= 1;
            end
        end
    end
end

endmodule
