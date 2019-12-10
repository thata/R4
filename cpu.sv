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
    logic dcMemWrite;
    logic dcRegWrite;
    logic aluSrc;
    logic branch;
    decoder dc(
        instr,
        dcMemWrite,
        dcRegWrite,
        aluSrc,
        aluOp,
        dcMemToReg,
        branch
    );
                           
    assign instrAddr = pc;
    assign we = dcMemWrite;

    logic [31:0] rfWriteData3Sel;
    assign rfAddr1 = instr[19:15]; // rs1
    assign rfAddr2 = instr[24:20]; // rs2
    assign rfAddr3 = instr[11:7];  // rd
    assign rfWe3 = dcRegWrite;
    assign rfWriteData3Sel = (dcMemToReg) ? readData : result; 
    assign rfWriteData3 = rfWriteData3Sel;

    logic [31:0] aluIn2Sel;
    assign aluIn1 = rfReadData1;
    assign aluIn2Sel = (aluSrc === 0) ? imm : rfReadData2;
    assign aluIn2 = aluIn2Sel;
    assign result = aluResult;

    assign dataAddr = result;
    assign writeData = rfReadData2;

    logic [31:0] nextPC;
    assign nextPC = (branch & aluZero) ? pc + imm
                                        : pc + 4;

    always_ff @(posedge clk) begin
        if (!n_reset)
            pc <= 32'b0;
        else
            pc <= nextPC;
    end

    // always @(*) begin
    //     // $display("instr %b", instr);
    //     // $display("result %b", aluResult);
    //     // $display("zero %b", aluZero);
    //     // $display("branch %b", branch);
    //     $display("pc %h", pc);
    //     $display("nextPC %h", nextPC);
    //     // $display("A1 %b", rfAddr1);
    //     // $display("RD1 %b", rfReadData1);
    //     // $display("A2 %b", rfAddr2);
    //     // $display("RD2 %b", rfReadData2);
    //     // $display("A3 %b", rfAddr3);
    //     // $display("WD3 %b", rfWriteData3);
    //     // $display("aluSrc %b", aluSrc);
    //     // $display("aluOp %b", aluOp);
    //     // $display("aluIn1 %b", aluIn1);
    //     // $display("aluIn2 %b", aluIn2);
    // end
endmodule
