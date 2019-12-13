module decoder(
    input logic [31:0] instr,
    output logic memWrite,
    output logic regWrite,
    output logic aluSrc,
    output logic [3:0] aluOp,
    output logic memToReg,
    output logic branch
);
    logic [6:0] opCode;
    logic [2:0] funct3;
    logic [6:0] funct7;

    // 00: ADD, 01: SUB, 10: Funct, 11: ---
    logic [1:0] preAluOp;

    alu_controller ac(
        preAluOp,
        funct3,
        funct7,
        aluOp
    );

    assign opCode = instr[6:0];

    assign memWrite = (opCode === 7'b0100011) ? 1'b1 : 1'b0;

    assign regWrite = (opCode === 7'b0000011) ? 1'b1 : // I type (lw)
                      (opCode === 7'b0110011) ? 1'b1   // R type (add)
                                              : 1'b0;

    // select alu.in2 src
    // 0: imm
    // 1: ds2 (B, R type)
    assign aluSrc = (opCode === 7'b0110011) ? 1'b1 : // R type
                    (opCode === 7'b1100011) ? 1'b1   // B type
                                            : 1'b0;

    assign memToReg = (opCode == 7'b0000011) ? 1'b1 : 1'b0;

    assign branch = (opCode === 7'b1100011) ? 1'b1 // B type
                                            : 1'b0;

    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];
    assign preAluOp = (opCode == 7'b1100011) ? 2'b01 : // B type => sub
                      (opCode == 7'b0000011) ? 2'b00 : // lw => add
                      (opCode == 7'b0100011) ? 2'b00   // sw => add
                                             : 2'b10;  // funct
endmodule

module alu_controller(
    input logic [1:0] preAluOp,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic [3:0] aluOp
);

    logic [9:0] funct;

    assign funct = {funct7, funct3};

    always_comb begin
        case(preAluOp)
            2'b00: aluOp = 4'b0000; // add
            2'b01: aluOp = 4'b0001; // sub
            default: case(funct)
                10'b0000000000: aluOp = 4'b0000;
                10'b0000000000: aluOp = 4'b0000;
                default: aluOp = 4'bXXXX;
            endcase
        endcase
    end
endmodule
