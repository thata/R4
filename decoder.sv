module decoder(
    input logic [31:0] instr,
    output logic memWrite,
    output logic regWrite,
    output logic aluIn1Src,
    output logic aluIn2Src,
    output logic [3:0] aluOp,
    output logic memToReg,
    output logic branch,
    output logic jump,
    output logic jumpReg
);
    logic [6:0] opCode;
    logic [2:0] funct3;
    logic [6:0] funct7;

    // 00: ADD, 01: SUB, 10: Funct7 + Funct3, 11: Funct3
    logic [1:0] preAluOp;

    alu_controller ac(
        preAluOp,
        funct3,
        funct7,
        aluOp
    );

    assign opCode = instr[6:0];

    assign memWrite = (opCode === 7'b0100011) ? 1'b1 : 1'b0;

    assign regWrite = (opCode === 7'b0000011) ? 1'b1 : // lw
                      (opCode === 7'b0010011) ? 1'b1 : // addi, ori
                      (opCode === 7'b0110011) ? 1'b1 : // R type (add)
                      (opCode === 7'b0110111) ? 1'b1 : // lui
                      (opCode === 7'b1101111) ? 1'b1 : // jal
                      (opCode === 7'b1100111) ? 1'b1   // jalr
                                              : 1'b0;

    // select alu.in1 src
    // 0: 32'b0
    // 1: ds1
    assign aluIn1Src = (opCode === 7'b0110111) ? 1'b0 // lui
                                               : 1'b1;

    // select alu.in2 src
    // 0: imm
    // 1: ds2 (B, R type)
    assign aluIn2Src = (opCode === 7'b0110011) ? 1'b1 : // R type
                    (opCode === 7'b1100011) ? 1'b1   // B type
                                            : 1'b0;

    assign memToReg = (opCode == 7'b0000011) ? 1'b1 : 1'b0;

    assign branch = (opCode === 7'b1100011) ? 1'b1 // B type
                                            : 1'b0;

    assign jump = (opCode === 7'b1101111) ? 1'b1 : // jal
                  (opCode === 7'b1100111) ? 1'b1   // jalr
                                          : 1'b0;

    assign jumpReg = (opCode === 7'b1100111) ? 1'b1 // jalr
                                             : 1'b0;

    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];
    assign preAluOp = (opCode == 7'b1100011) ? 2'b01 : // B type => sub
                      (opCode == 7'b0000011) ? 2'b00 : // lw => add
                      (opCode == 7'b0100011) ? 2'b00 : // sw => add
                      (opCode == 7'b1101111) ? 2'b00 : // jal => add
                      (opCode == 7'b1100111) ? 2'b00 : // jalr => add
                      (opCode == 7'b0110111) ? 2'b00 : // lui => add
                      (opCode == 7'b0010011) ? 2'b11   // addi, ori => funct3
                                             : 2'b10;  // funct

    // always @(*) begin
    //     $display("aluIn2Src %b", aluIn2Src);
    //     $display("preAluOp %b", preAluOp);
    //     $display("aluOp %b", aluOp);
    // end
endmodule

// alu_controller
//
// preAluOp | case
// -------------------
// 00       | add
// 01       | sub
// 10       | funct7 + funct3
// 11       | funct3
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
            2'b11: case(funct3)
                3'b000: aluOp = 4'b0000; // addi => add
                3'b110: aluOp = 4'b1000; // ori => or
                default: aluOp = 4'bXXXX;
            endcase
            default: case(funct)
                10'b0000000000: aluOp = 4'b0000; // add
                10'b0100000000: aluOp = 4'b0001; // sub
                10'b0000000111: aluOp = 4'b1001; // and
                10'b0000000110: aluOp = 4'b1000; // or
                10'b0000000010: aluOp = 4'b0011; // slt
                10'b0000000011: aluOp = 4'b0100; // sltu
                default: aluOp = 4'bXXXX;
            endcase
        endcase
    end
endmodule
