module cpu_test;
    logic clk, n_reset;
    logic [31:0] instr;
    logic [31:0] readData;
    logic [31:0] result;
    logic [31:0] instrAddr;
    logic [31:0] dataAddr;
    logic [31:0] writeData;
    logic we;

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
            we === 1'bX
        ) $display("PASSED"); else $display("FAILED");

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
            we === 1'bX
        ) $display("PASSED"); else $display("FAILED");

        clk = 1; clk = 0; #10

        // reset applied & lw $1, 0($0)
        instr = {
            12'b0, // imm
            5'b0, // rs1
            3'b010, // funct3
            5'b1, // rd
            7'b0000011 // opCode
        };
        readData = 32'bX;
        n_reset = 1;
        #10
        assert (
            result === 32'b0 &&
            instrAddr === 32'b0 &&
            dataAddr === 32'bX &&
            writeData === 32'bX &&
            we === 1'bX
        ) $display("PASSED"); else $display("FAILED %h %h %h %h %b", result, instrAddr, dataAddr, writeData, we);


        // // lw $1, 0($0)
        // // instr | readData || result | instrAddr | dataAddr | writeData | we
        // // ----- | XXXXXXXX || result | instrAddr | dataAddr | writeData | we
        // instr = {
        //     12'b0, // imm
        //     5'b0, // rs1
        //     3'b010, // funct3
        //     5'b1, // rd
        //     7'b0000011 // opCode
        // };
        // $display(999);
    end
endmodule
