module immgen(
    input logic [31:0] instr,
    output logic [31:0] imm
);
    logic [6:0] opCode;
    logic [11:0] imm12;
    logic [12:0] imm13;
    logic [20:0] imm21;

    assign opCode = instr[6:0];

    assign imm12 = (opCode == 7'b0100011) ? {instr[31:25], instr[11:7]} // S type
                                          : instr[31:20];               // other

    // B type
    assign imm13 = {instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

    // J type
    assign imm21 = {instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

    // sign extend
    assign imm = (opCode == 7'b1100011) ? {{19{imm13[12]}}, imm13} :
                 (opCode == 7'b1101111) ? {{11{imm21[20]}}, imm21} 
                                        : {{20{imm12[11]}}, imm12};
                                        
    // always @(imm) begin
    //     $display("instr %b", instr);
    //     $display("imm12 %b", imm12);
    //     $display("imm13 %b", imm13);
    //     $display("imm21 %b", imm21);
    //     $display("imm %b", imm);
    // end
endmodule
