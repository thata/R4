// iverilog -g 2012 -s immgen_test *.sv && ./a.out
module immgen_test;
    logic [31:0] instr;
    logic [31:0] imm;

    immgen ig(instr, imm);

    initial begin
        // I type immediate
        instr = lw(5'b0, 5'b0, 12'b1111_1111_1111);
        #10;
        assert (imm === 32'b11111111_11111111_11111111_11111111) $display("PASSED"); else $display("FAILED %b", imm);

        // S type immediate
        instr = sw(5'b0, 5'b1, 12'b1111_11111110);
        #10;
        assert (imm === 32'b11111111_11111111_11111111_11111110) $display("PASSED"); else $display("FAILED %b", imm);

        // B type immediate
        instr = beq(5'b0, 5'b0, 12'b1111_0000_1111);
        #10;
        assert (imm === 32'b1111_1111_1111_1111_1111_1110_0001_1110) $display("PASSED"); else $display("FAILED %b", imm);

        // jal immediate
        instr = jal(5'b0, 20'b0000_1111_1010_0101_1100);
        #10;
        assert (imm === 32'b0001_1111_0100_1011_1000) $display("PASSED"); else $display("FAILED %b", imm);

        instr = jal(5'b0, 20'b1000_1111_1010_0101_1100);
        #10;
        assert (imm === 32'b1111_1111_1111_0001_1111_0100_1011_1000) $display("PASSED"); else $display("FAILED %b", imm);

        // jalr immediate
        instr = jalr(5'd0, 5'd0, 12'b1100_1111_0011);
        #10;
        assert (imm === 32'b1111_1111_1111_1111_1111_1100_1111_0011) $display("PASSED"); else $display("FAILED %b", imm);

        // U type immediate (lui)
        instr = lui(5'd1, 20'b1111_0000_1100_0011_0101);
        #10;
        assert (imm === 32'b1111_0000_1100_0011_0101_0000_0000_0000) $display("PASSED"); else $display("FAILED %b", imm);
    end
endmodule
