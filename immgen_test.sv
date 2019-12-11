// iverilog -g 2012 -s immgen_test *.sv && ./a.out
module immgen_test;
    logic [31:0] instr;
    logic [31:0] imm;

    immgen ig(instr, imm);

    initial begin
        // I形式の即値
        instr = lw(5'b0, 5'b0, 12'b1111_1111_1111);
        #10
        assert (imm === 32'b11111111_11111111_11111111_11111111) $display("PASSED"); else $display("FAILED %b", imm);

        // S形式の即値
        instr = sw(5'b0, 5'b1, 12'b1111_11111110);
        #10
        assert (imm === 32'b11111111_11111111_11111111_11111110) $display("PASSED"); else $display("FAILED %b", imm);

        // B形式の即値
        instr = beq(5'b0, 5'b0, 11'b1111_0000_111);
        #10
        assert (imm === 32'b1111_1111_1111_1111_1111_1111_0000_1110) $display("PASSED"); else $display("FAILED %b", imm);
    end
endmodule
