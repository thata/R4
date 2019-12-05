module decoder(
    input logic [31:0] instr,
    output logic memWrite,
    output logic regWrite,
    output logic aluSrc,
    output logic memToReg
);
    logic [6:0] opCode;

    assign opCode = instr[6:0];

    assign memWrite = (opCode === 7'b0100011) ? 1'b1 : 1'b0;

    assign regWrite = (opCode === 7'b0000011) ? 1'b1 : // I type (lw)
                      (opCode === 7'b0110011) ? 1'b1   // R type (add)
                                              : 1'b0;

    // select alu.in2 src
    // 0: imm
    // 1: ds2 (B, R type)
    assign aluSrc = (opCode === 7'b0110011) ? 1'b1 // R type
                                            : 1'b0;


    assign memToReg = (opCode == 7'b0000011) ? 1'b1 : 1'b0;
endmodule