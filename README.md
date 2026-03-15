This project implements a UART (Universal Asynchronous Receiver Transmitter) communication system using Verilog RTL.
The design includes a UART transmitter, receiver, and a baud rate generator to control transmission timing. 
A testbench is used to simulate the design in Xilinx Vivado and verify correct serial data transmission and reception. 
The simulation demonstrates successful communication where transmitted data is correctly received through the UART protocol.

UART Transmitter:
Serializes 8-bit parallel input data and transmits it bit-by-bit using UART frame format consisting of start bit, data bits, and stop bit.

UART Receiver:
Serializes 8-bit parallel input data and transmits it bit-by-bit using UART frame format consisting of start bit, data bits, and stop bit.

Baud Rate Generator:
Generates periodic timing pulses (baud_tick) that control the speed of UART transmission and reception.

Top Module:
Integrates the transmitter, receiver, and baud generator, connecting the transmitted data directly to the receiver for simulation verification.

Working Principle:
- The testbench provides input data and a start signal to initiate transmission.
- The UART transmitter converts the parallel input byte into a serial bit stream following UART frame format.
- The baud rate generator controls the timing of each transmitted bit.
- The transmitted serial data (tx_line) is connected to the UART receiver.
- The receiver samples the incoming bits and reconstructs the original 8-bit data.
- The simulation waveform verifies that the received data matches the transmitted data.


The simulation waveform confirms successful UART communication where the transmitted data (data_in = 0xAA) is correctly reconstructed by the receiver (data_out = 0xAA). 
The tx_done and rx_done signals indicate completion of transmission and reception.
