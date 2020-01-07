// iverilog -g 2012 -s decoder_test *.sv && ./a.out
module decoder_test;
    logic [31:0] instr;
    logic memWrite;
    logic regWrite;
    logic aluIn1Src;
    logic aluIn2Src;
    logic [3:0] aluOp;
    logic memToReg;
    logic branch;
    logic jump;
    logic jumpReg;

    decoder dut(instr, memWrite, regWrite, aluIn1Src, aluIn2Src, aluOp, memToReg, branch, jump, jumpReg);

    initial begin
        // lw
        instr = lw(5'b0, 5'b0, 12'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            memToReg === 1 &&
            aluIn2Src === 0 // imm
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluIn2Src);

        // add
        instr = add(5'b0, 5'b0, 5'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            memToReg === 0 &&
            aluIn2Src === 1 // rs2
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluIn2Src);

        // sw
        instr = sw(5'b0, 5'b1, 11'b0);
        #10
        assert (
            memWrite === 1 &&
            regWrite === 0 &&
            memToReg === 0 &&
            aluIn2Src === 0 // imm
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluIn2Src);
    end
endmodule
