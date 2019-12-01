
module immgen(
    input logic [31:0] instr,
    output logic [31:0] imm
);
    assign imm = instr[31:20];
endmodule
