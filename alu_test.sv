// ALU testbench
// iverilog -g 2012 -s alu_test *.sv && ./a.out
module alu_test;
    logic [31:0] in1, in2;
    logic [3:0] op;
    logic [31:0] result;
    logic negative, zero;

    logic [7:0] sa, sb;
    logic [7:0] ua, ub;


    alu dut(
        in1,
        in2,
        op,
        result,
        negative,
        zero
    );

    initial begin
        // add
        // 0x000F + 0x00F0 = 0x00FF
        in1 = 32'h000F; in2 = 32'h00F0;
        op = 4'b0000;
        #10
        assert (
            result === 32'h00FF &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // 0xFFFFFFFF + 0x00000001 = 0x00000000
        in1 = 32'hFFFFFFFF; in2 = 32'h00000001;
        op = 4'b0000;
        #10
        assert (
            result === 32'h00000000 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sub
        // 0x00000000 - 0x00000001 = 0xFFFFFFFF
        in1 = 32'h00000000; in2 = 32'h00000001;
        op = 4'b0001;
        #10
        assert (
            result === 32'hFFFFFFFF &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // and
        in1 = 32'hFF00FF00; in2 = 32'h0F0F0F0F;
        op = 4'b1001;
        #10
        assert (
            result === 32'h0F000F00 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // or
        in1 = 32'hFF00FF00; in2 = 32'h0F0F0F0F;
        op = 4'b1000;
        #10
        assert (
            result === 32'hFF0FFF0F &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // xor
        in1 = 32'b1100; in2 = 32'b1010;
        op = 4'b0101;
        #10
        assert (
            result === 32'b0110 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sll
        in1 = 32'h000F; in2 = 32'h0004;
        op = 4'b0010;
        #10
        assert (
            result === 32'h00F0 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // srl
        in1 = 32'h00F0; in2 = 32'h0004;
        op = 4'b0110;
        #10
        assert (
            result === 32'h000F &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // sra
        // 16 >>> 2 = 4
        in1 = 32'd16; in2 = 32'h0002;
        op = 4'b0111;
        #10
        assert (
            result === 32'd4 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %h %b %b", result, negative, zero);

        // FFFFFFFF >>> 1 = FFFFFFFF
        in1 = 32'hFFFFFFFF; in2 = 32'h1;
        op = 4'b0111;
        #10
        assert (
            result === 32'hFFFFFFFF &&
            negative === 1 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // slt
        // 32'b0010 < 32'b0100 ? 1 : 0
        in1 = 32'b0010; in2 = 32'b0100;
        op = 4'b0011;
        #10
        assert (
            result === 32'b1 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'b0100 < 32'b0010 ? 1 : 0
        in1 = 32'b0011; in2 = 32'b0010;
        op = 4'b0011;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'FFFFFFFE(-2) < 32'hFFFFFFFF(-1) ? 1 : 0
        in1 = 32'hFFFFFFFE; in2 = 32'hFFFFFFFF;
        op = 4'b0011;
        #10
        assert (
            result === 32'b1 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'FFFFFFFF(-1) < 32'hFFFFFFFE(-2) ? 1 : 0
        in1 = 32'hFFFFFFFF; in2 = 32'hFFFFFFFE;
        op = 4'b0011;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'h00FF(255) < 32'hFFFFFFFF(-1) ? 1 : 0
        in1 = 32'h00FF; in2 = 32'hFFFFFFFF;
        op = 4'b0011;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'hFFFFFFFF(-1) < 32'h00FF(255) ? 1 : 0
        in1 = 32'hFFFFFFFF; in2 = 32'h00FF;
        op = 4'b0011;
        #10
        assert (
            result === 32'b1 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // sltu
        // 32'b0010 < 32'b0100 ? 1 : 0
        in1 = 32'b0010; in2 = 32'b0100;
        op = 4'b0100;
        #10
        assert (
            result === 32'b1 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'b0100 < 32'b0010 ? 1 : 0
        in1 = 32'b0100; in2 = 32'b0010;
        op = 4'b0100;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'FFFFFFFF(4294967295) < 32'hFFFFFFFE(4294967294) ? 1 : 0
        in1 = 32'hFFFFFFFF; in2 = 32'hFFFFFFFE;
        op = 4'b0100;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'h00FF(255) < 32'hFFFFFFFF(4294967295) ? 1 : 0
        in1 = 32'h00FF; in2 = 32'hFFFFFFFF;
        op = 4'b0100;
        #10
        assert (
            result === 32'b1 &&
            negative === 0 &&
            zero === 0
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);

        // 32'hFFFFFFFF(4294967295) < 32'h00FF(255) ? 1 : 0
        in1 = 32'hFFFFFFFF; in2 = 32'h00FF;
        op = 4'b0100;
        #10
        assert (
            result === 32'b0 &&
            negative === 0 &&
            zero === 1
        ) $display("PASSED"); else $display("FAILED %b %b %b", result, negative, zero);
    end
endmodule
