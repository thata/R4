
module immgen(
    input logic [31:0] instr,
    output logic [31:0] imm
);
    logic [6:0] opCode;

    assign opCode = instr[6:0];

    assign imm = (opCode == 7'b0100011) ? {instr[31:25], instr[11:7]}
                                        : instr[31:20];
endmodule
