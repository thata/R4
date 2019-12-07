
module immgen(
    input logic [31:0] instr,
    output logic [31:0] imm
);
    logic [6:0] opCode;
    logic [11:0] _imm;

    assign opCode = instr[6:0];

    assign _imm = (opCode == 7'b0100011) ? {instr[31:25], instr[11:7]} :
                  (opCode == 7'b1100011) ? {instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}
                                         : instr[31:20];
    // sign extend
    assign imm = {{20{_imm[11]}}, _imm};
endmodule
