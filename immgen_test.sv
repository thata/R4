module immgen_test;
    logic [31:0] instr;
    logic [31:0] imm;

    immgen ig(instr, imm);

    initial begin
        // I形式の即値
        instr = {
            12'b0, // imm
            5'b0, // rs1
            3'b010, // funct3
            5'b1, // rd
            7'b0000011 // opCode
        };
        #10
        assert (imm === 32'b0) $display("PASSED"); else $display("FAILED %b", imm);
    end
endmodule
