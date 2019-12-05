module decoder(
    input logic [31:0] instr,
    output logic memWrite,
    output logic regWrite,
    output logic aluSrc
);
    logic [6:0] opCode;

    assign opCode = instr[6:0];

    assign memWrite = (instr === 32'bX) ? 1'bX
                                  : 1'b0;

    assign regWrite = (instr === 32'bX) ? 1'bX
                                  : 1'b1;

    // select alu.in2 src
    // 0: imm
    // 1: ds2 (B, S, R type)
    assign aluSrc = (opCode === 7'b0110011) ? 1'b1 : 1'b0;

endmodule
