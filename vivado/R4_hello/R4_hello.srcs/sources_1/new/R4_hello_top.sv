module R4_hello_top(
    input logic clk,
    input logic [15:0] sw,
    output logic [15:0] led
);
    assign led = sw;
endmodule
