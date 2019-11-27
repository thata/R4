module regfile_test;
    logic clk, we3;
    logic [5:0] addr1, addr2, addr3;
    logic [31:0] writeData3, readData1, readData2;

    regfile rf(
        clk,
        we3,
        addr1,
        addr2,
        addr3,
        writeData3,
        readData1,
        readData2
    );

    initial begin
        clk = 0;

        // x[1] へ 0x00000000 をセット（次のクロックでセットされる）
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 1     | 0     | 1     | 1   | 00000000   || XXXXXXXX  | XXXXXXXX
        addr1 = 6'd1; addr2 = 6'd0; addr3 = 6'd1; we3 = 1; writeData3 = 32'd0;
        assert(
            readData1 === 32'bX &&
            readData2 === 32'bX
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);

        clk = 1; clk = 0; #10

        // x[1] に 0x00000000 がセットされる
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 1     | 0     | 0     | 0   | 00000000   || XXXXXXXX  | XXXXXXXX
        addr1 = 6'd1; addr2 = 6'd0; addr3 = 6'd0; we3 = 0; writeData3 = 32'd0;
        clk = 1; clk = 0; #10
        assert(
            readData1 === 32'b0 &&
            readData2 === 32'bX
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);

    end
endmodule
