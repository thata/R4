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
        ) $display("PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

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
        ) $display("PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

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
            // writeData === 32'bX &&
            we === 1'b0
        ) $display("PASSED"); else $display("FAILED %b %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

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
            // writeData === 32'bX &&
            we === 1'b0
        ) $display("PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);

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
        ) $display("PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);
    end
endmodule
