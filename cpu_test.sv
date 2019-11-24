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

    );

    initial begin
        // lw
        $display(999);
    end
endmodule
