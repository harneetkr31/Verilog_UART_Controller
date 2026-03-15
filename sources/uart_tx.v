module uart_tx(
    input clk,
    input rst,
    input tx_start,
    input [7:0] data_in,
    input baud_tick,
    output reg tx,
    output reg tx_done
);

reg [3:0] bit_index;
reg [7:0] data_reg;
reg sending;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        tx <= 1;
        sending <= 0;
        bit_index <= 0;
        tx_done <= 0;
    end
    else
    begin
        if(tx_start && !sending)
        begin
            sending <= 1;
            data_reg <= data_in;
            bit_index <= 0;
            tx_done <= 0;
        end
        else if(sending && baud_tick)
        begin
            case(bit_index)

            0: tx <= 0;               // start bit
            1: tx <= data_reg[0];
            2: tx <= data_reg[1];
            3: tx <= data_reg[2];
            4: tx <= data_reg[3];
            5: tx <= data_reg[4];
            6: tx <= data_reg[5];
            7: tx <= data_reg[6];
            8: tx <= data_reg[7];
            9: tx <= 1;               // stop bit

            endcase

            if(bit_index == 9)
            begin
                sending <= 0;
                tx_done <= 1;
                bit_index <= 0;
            end
            else
                bit_index <= bit_index + 1;
        end
    end
end

endmodule
