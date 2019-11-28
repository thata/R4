module cpu(
    input clk, n_reset,
    input logic [31:0] instr,
    input logic [31:0] readData,
    output logic [31:0] result,
    output logic [31:0] instrAddr,
    output logic [31:0] dataAddr,
    output logic [31:0] writeData,
    output logic we
);
    logic [31:0] pc;

    assign instrAddr = pc;

    always_ff @(posedge clk) begin
        if (!n_reset)
            pc <= 32'b0;
    end
endmodule
