module decoder_test;
    logic [31:0] instr;
    logic memWrite;
    logic regWrite;
    logic aluSrc;
    logic memToReg;

    decoder dut(instr, memWrite, regWrite, aluSrc, memToReg);

    initial begin
        // lw
        instr = lw(5'b0, 5'b0, 12'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            memToReg === 1 &&
            aluSrc === 0 // imm
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluSrc);

        // add
        instr = add(5'b0, 5'b0, 5'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            memToReg === 0 &&
            aluSrc === 1 // rs2
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluSrc);

        // sw
        instr = sw(5'b0, 5'b1, 11'b0);
        #10
        assert (
            memWrite === 1 &&
            regWrite === 0 &&
            memToReg === 0 &&
            aluSrc === 0 // imm
        ) $display("PASSED"); else $display("FAILED %b, %b %b %b %b", instr, memWrite, regWrite, memToReg, aluSrc);
    end
endmodule
