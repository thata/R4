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

    // pc
    logic [31:0] pc;

    // alu
    logic [31:0] aluIn1, aluIn2, aluResult;
    logic [3:0] aluOp;
    logic aluNegative, aluZero;

    alu alu(
        aluIn1,
        aluIn2,
        aluOp,
        aluResult,
        aluNegative,
        aluZero
    );

    // regfile
    logic rfWe3;
    logic [4:0] rfAddr1, rfAddr2, rfAddr3;
    logic [31:0] rfWriteData3, rfReadData1, rfReadData2;
    logic [4:0] rdAddr;

    regfile rf(
        clk,
        rfWe3,
        rfAddr1,
        rfAddr2,
        rfAddr3,
        rfWriteData3,
        rfReadData1,
        rfReadData2
    );

    // immgen
    logic [31:0] imm;
    immgen ig(instr, imm);

    // decoder
    logic dcWE;
    decoder dc(
        instr,
        dcWE
    );

    assign instrAddr = pc;
    assign we = dcWE;

    assign rfAddr1 = instr[19:15]; // rs1
    // assign rfAddr3 = instr[11:7]; // rd

    assign aluOp = 4'b0000;
    assign aluIn1 = rfReadData1;
    assign aluIn2 = imm;
    assign result = aluResult;

    assign dataAddr = result;

    // assign rfWriteData3 = writeData;

    always_ff @(posedge clk) begin
        if (!n_reset)
            pc <= 32'b0;
    end
endmodule

module decoder(
    input logic [31:0] instr,
    output logic we
);
    assign we = (instr === 32'bX) ? 1'bX
                                  : 1'b0;
endmodule
