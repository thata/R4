// regfile testbench
// iverilog -g 2012 -s regfile_test *.sv && ./a.out
module regfile_test;
    logic clk, we3;
    logic [4:0] addr1, addr2, addr3;
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

        // $1 へ 0x0000FFFF をセット（次のクロックでセットされる）
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 1     | 0     | 1     | 1   | 00000000   || XXXXXXXX  | 00000000
        addr1 = 5'd1; addr2 = 5'd0; addr3 = 5'd1; we3 = 1; writeData3 = 32'hFFFF; #10
        assert(
            readData1 === 32'bX &&
            readData2 === 32'b0
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);

        clk = 1; clk = 0; #10

        // $1 に 0x0000FFFF がセットされる
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 1     | 0     | 0     | 0   | 00000000   || 0000FFFF  | 00000000
        addr1 = 5'd1; addr2 = 5'd0; addr3 = 5'd0; we3 = 0; writeData3 = 32'd0; #10;
        assert(
            readData1 === 32'hFFFF &&
            readData2 === 32'b0
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);

        clk = 1; clk = 0; #10

        // $31 に 0xFFFF0000 をロード
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 31    | 0     | 31    | 1   | FFFF0000   || XXXXXXXX  | 00000000
        addr1 = 5'd31; addr2 = 5'd0; addr3 = 5'd31; we3 = 1; writeData3 = 32'hFFFF0000; #10;
        assert(
            readData1 === 32'hX &&
            readData2 === 32'h0
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);
        
        clk = 1; clk = 0; #10

        // $31 に 0xFFFF0000 がセットされる
        // addr1 | addr2 | addr3 | we3 | writeData3 || readData1 | readData2
        // 31    | 0     | 31    | 1   | FFFF0000   || 00000000  | 00000000
        addr1 = 5'd31; addr2 = 5'd0; addr3 = 5'd31; we3 = 0; writeData3 = 32'd0; #10;
        assert(
            readData1 === 32'hFFFF0000 &&
            readData2 === 32'h0
        ) $display("PASSED"); else $display("FAILED %b %b", readData1, readData2);
    end
endmodule
