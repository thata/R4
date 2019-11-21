// ALU testbench
// iverilog -g 2012 -s alu_test *.sv && ./a.out
module alu_test;
    logic [31:0] in1, in2;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic [31:0] result;
    logic negative, zero;

    alu dut(
        in1,
        in2,
        funct3,
        funct7,
        result,
        negative,
        zero
    );

    initial begin
        // add
        // 0x000F + 0x00F0 = 0x00FF
        in1 = 32'h000F; in2 = 32'h00F0;
        funct3 = 3'b000; funct7 = 7'b0000000; #10
        assert (
            result === 32'h00FF &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // 0xFFFFFFFF + 0x00000001 = 0x00000000
        in1 = 32'hFFFFFFFF; in2 = 32'h00000001;
        funct3 = 3'b000; funct7 = 7'b0000000; #10
        assert (
            result === 32'h00000000 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sub
        // 0x00000000 - 0x00000001 = 0xFFFFFFFF
        in1 = 32'h00000000; in2 = 32'h00000001;
        funct3 = 3'b000; funct7 = 7'b0100000; #10
        assert (
            result === 32'hFFFFFFFF &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // and
        in1 = 32'hFF00FF00; in2 = 32'h0F0F0F0F;
        funct3 = 3'b111; funct7 = 7'b0000000; #10
        assert (
            result === 32'h0F000F00 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // or
        in1 = 32'hFF00FF00; in2 = 32'h0F0F0F0F;
        funct3 = 3'b110; funct7 = 7'b0000000; #10
        assert (
            result === 32'hFF0FFF0F &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // xor
        in1 = 32'b1100; in2 = 32'b1010;
        funct3 = 3'b100; funct7 = 7'b0000000; #10
        assert (
            result === 32'b0110 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sll
        in1 = 32'h000F; in2 = 32'h0004;
        funct3 = 3'b001; funct7 = 7'b0000000; #10
        assert (
            result === 32'h00F0 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // srl
        in1 = 32'h00F0; in2 = 32'h0004;
        funct3 = 3'b101; funct7 = 7'b0000000; #10
        assert (
            result === 32'h000F &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sra
        // 16 >>> 2 = 4
        in1 = 32'd16; in2 = 32'h0002;
        funct3 = 3'b101; funct7 = 7'b0100000; #10
        assert (
            result === 32'd4 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // FFFFFFFF >>> 1 = FFFFFFFF
        in1 = 32'hFFFFFFFF; in2 = 32'h1;
        funct3 = 3'b101; funct7 = 7'b0100000; #10
        assert (
            result === 32'hFFFFFFFF &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);
    end
endmodule
