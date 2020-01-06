// iverilog -g 2012 -s cpu_test *.sv && ./a.out
module cpu_test;
    logic clk, n_reset;
    logic [31:0] instr;
    logic [31:0] readData;
    logic [31:0] result;
    logic [31:0] instrAddr;
    logic [31:0] dataAddr;
    logic [31:0] writeData;
    logic we;

    logic [5:0] i;

    cpu dut(
        clk,
        n_reset,
        instr,
        readData,
        result,
        instrAddr,
        dataAddr,
        writeData,
        we
    );

    initial begin
        n_reset = 1;
        clk = 0;

        // reset registers
        for (i = 0; i < 32; i = i + 1) begin
            // add $rd, $rs1, $rs2
            instr = add(i[4:0], 5'b0, 5'b0);
            #10
            clk = 1; clk = 0;
        end

        // before reset
        instr = 32'bX;
        readData = 32'bX;
        n_reset = 1;
        #10
        assert (
            result === 32'bX &&
            instrAddr === 32'bX &&
            dataAddr === 32'bX &&
            writeData === 32'bX &&
            we === 1'b0
        ) $display("1 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10

        // try reset
        instr = 32'bX;
        readData = 32'bX;
        n_reset = 0;
        #10
        assert (
            result === 32'bX &&
            instrAddr === 32'bX &&
            dataAddr === 32'bX &&
            writeData === 32'bX &&
            we === 1'b0
        ) $display("2 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10

        // PCがリセットされる(instrAddr == 0)こと。
        // また、 lw $1, 0($0) が読み込まれて
        // 読み込み先のアドレスが指定される（dataAddr == 0）こと。 
        instr = lw(5'b1, 5'b0, 12'b0);
        readData = 32'h00FF;
        n_reset = 1;
        #10
        assert (
            result === 32'b0 &&
            instrAddr === 32'b0 &&
            dataAddr === 32'b0 &&
            writeData === 32'b0 &&
            we === 1'b0
        ) $display("3 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10

        // add $1, $1, $1
        instr = add(5'b1, 5'b1, 5'b1);
        readData = 32'bX;
        n_reset = 1;
        #10
        assert (
            result === 32'h01FE &&
            instrAddr === 32'h0004 &&
            dataAddr === 32'h01FE &&
            writeData === 32'h00FF &&
            we === 1'b0
        ) $display("4 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10

        // sw $1, 0($0)
        instr = sw(5'b0, 5'b1, 11'b0);
        readData = 32'h00FF;
        n_reset = 1;
        #10
        assert (
            result === 32'h0000 &&
            instrAddr === 32'h0008 &&
            dataAddr === 32'h0000 &&
            writeData === 32'h01FE &&
            we === 1'b1
        ) $display("5 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10

        // // $31と$30へ0xFFをセット
        // instr = lw(5'd30, 5'b0, 12'b0);
        // readData = 32'h00FF;
        // #10
        // clk = 1; clk = 0;

        // instr = lw(5'd31, 5'b0, 12'b0);
        // readData = 32'h00FF;
        // #10
        // clk = 1; clk = 0;

        // beq $30, $31, 0b0110
        // 12バイト先へ分岐
        instr = beq(5'd30, 5'd31, 12'b0110);
        n_reset = 1;
        #10;
        assert (
            result === 32'h0000 &&
            instrAddr === 32'h000C &&
            dataAddr === 32'h0000 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("6 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // add $0, $0, $0 (nop)
        instr = add(5'b0, 5'b0, 5'b0);
        n_reset = 1;
        #10;
        assert (
            result === 32'h0000 &&
            instrAddr === 32'h0018 &&
            dataAddr === 32'h0000 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("7 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // addi $1, $0, 0x0F0
        instr = addi(5'b1, 5'b0, 12'h0F0);
        n_reset = 1;
        #10;
        assert (
            result === 32'h00F0 &&
            instrAddr === 32'h001C &&
            dataAddr === 32'h00F0 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("8 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // addi $1, $1, 0x00F
        instr = addi(5'b1, 5'b1, 12'h00F);
        n_reset = 1;
        #10;
        assert (
            result === 32'h00FF &&
            instrAddr === 32'h0020 &&
            dataAddr === 32'h00FF &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("9 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // beq $1, $0, 0xFFF
        // 分岐しないことのテスト。実行後の instrAddr に分岐が発生していないこと
        instr = beq(5'd1, 5'd0, 12'hFF);
        n_reset = 1;
        #10;
        assert (
            result === 32'h00FF &&
            instrAddr === 32'h0024 &&
            dataAddr === 32'h00FF &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("10 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // add $0, $0, $0 (nop)
        // 上の分岐命令で分岐が発生していないこと
        instr = add(5'b0, 5'b0, 5'b0);
        n_reset = 1;
        #10;
        assert (
            result === 32'h0000 &&
            instrAddr === 32'h0028 &&
            dataAddr === 32'h0000 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("11 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // addi $2, $0, 0x000F
        instr = addi(5'd2, 5'd0, 12'h0F);
        n_reset = 1;
        #10;
        assert (
            result === 32'h000F &&
            instrAddr === 32'h002C &&
            dataAddr === 32'h000F &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("12 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // sub $1, $1, $2
        instr = sub(5'd1, 5'd1, 5'd2);
        n_reset = 1;
        #10;
        assert (
            result === 32'h00F0 &&
            instrAddr === 32'h0030 &&
            dataAddr === 32'h00F0 &&
            writeData === 32'h000F &&
            we === 1'b0
        ) $display("13 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // $1 = 0b1100
        instr = addi(5'd1, 5'd0, 12'b1100);
        n_reset = 1;
        #10;
        assert (
            result === 32'b1100 &&
            instrAddr === 32'h0034 &&
            dataAddr === 32'b1100 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("14 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // $2 = 0b1010
        instr = addi(5'd2, 5'd0, 12'b1010);
        n_reset = 1;
        #10;
        assert (
            result === 32'b1010 &&
            instrAddr === 32'h0038 &&
            dataAddr === 32'b1010 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("15 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // and $0, $1, $2
        instr = _and(5'd0, 5'd1, 5'd2);
        n_reset = 1;
        #10;
        assert (
            result === 32'b1000 &&
            instrAddr === 32'h003C &&
            dataAddr === 32'b1000 &&
            writeData === 32'b1010 &&
            we === 1'b0
        ) $display("16 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // or $0, $1, $2
        instr = _or(5'd0, 5'd1, 5'd2);
        n_reset = 1;
        #10;
        assert (
            result === 32'b1110 &&
            instrAddr === 32'h0040 &&
            dataAddr === 32'b1110 &&
            writeData === 32'b1010 &&
            we === 1'b0
        ) $display("17 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // slt $0, $2, $1
        instr = slt(5'd0, 5'd2, 5'd1);
        n_reset = 1;
        #10;
        assert (
            result === 32'b0001 &&
            instrAddr === 32'h0044 &&
            dataAddr === 32'b0001 &&
            writeData === 32'b1100 &&
            we === 1'b0
        ) $display("18 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // slt $0, $1, $2
        instr = slt(5'd0, 5'd1, 5'd2);
        n_reset = 1;
        #10;
        assert (
            result === 32'b0000 &&
            instrAddr === 32'h0048 &&
            dataAddr === 32'b0000 &&
            writeData === 32'b1010 &&
            we === 1'b0
        ) $display("19 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // slt $0, $1, $1
        instr = slt(5'd0, 5'd1, 5'd1);
        n_reset = 1;
        #10;
        assert (
            result === 32'b0000 &&
            instrAddr === 32'h004C &&
            dataAddr === 32'b0000 &&
            writeData === 32'b1100 &&
            we === 1'b0
        ) $display("20 PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // reset registers
        for (i = 0; i < 32; i = i + 1) begin
            // add $rd, $rs1, $rs2
            instr = add(i[4:0], 5'b0, 5'b0);
            #10
            clk = 1; clk = 0;
        end

        // jal
        instr = jal(5'd1, 20'h100);
        #10;
        assert (
            result === 32'h0200 &&
            instrAddr === 32'h00D0 &&
            dataAddr === 32'h0200 &&
            writeData === 32'b0000 &&
            we === 1'b0
        ) $display("21 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

        clk = 1; clk = 0; #10;

        // check pc and $1 values after jal
        instr = add(5'b0, 5'b1, 5'b0);
        n_reset = 1;
        #10;
        assert (
            result === 32'h00D4 &&
            instrAddr === 32'h02D0 &&
            dataAddr === 32'h00D4 &&
            writeData === 32'h0000 &&
            we === 1'b0
        ) $display("22 PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);
    end
endmodule
