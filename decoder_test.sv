module decoder_test;
    logic [31:0] instr;
    logic memWrite;
    logic regWrite;
    logic aluSrc;

    decoder dut(instr, memWrite, regWrite, aluSrc);

    initial begin
        // lw
        instr = lw(5'b0, 5'b0, 12'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            aluSrc === 0 // imm
        ) $display("PASSED"); else $display("FAILED %b, %b %b", instr, memWrite, regWrite, aluSrc);

        // add
        instr = add(5'b0, 5'b0, 5'b0);
        #10
        assert (
            memWrite === 0 &&
            regWrite === 1 &&
            aluSrc === 1 // rs2
        ) $display("PASSED"); else $display("FAILED %b, %b %b", instr, memWrite, aluSrc);
    end
endmodule
