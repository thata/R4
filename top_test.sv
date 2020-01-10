module top_test();
    logic clk = 0;
    logic n_reset;
    logic [31:0] instr;
    logic [31:0] readData;
    logic [31:0] result;
    logic [31:0] instrAddr;
    logic [31:0] dataAddr;
    logic [31:0] writeData;
    logic we;

    cpu _cpu(
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
        $display("hello");
    end

    always #5 begin
        clk <= !clk;
        
        if ($time > 1000000)
            $finish;
    end
endmodule
