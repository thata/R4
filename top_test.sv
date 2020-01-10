module top_test();
    logic clk = 0;
    logic n_reset = 1;
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

    test_rom _rom(
        instrAddr,
        instr
    );

    initial begin
        n_reset = 0;
        #10;
        n_reset = 1;
    end

    always #5 begin
        $display("pc %x", instrAddr);
        $display("instr %x", instr);
        $display("result %x", result);

        clk <= !clk;
        
        if ($time > 1000)
            $finish;
    end
endmodule

module test_rom(
    input logic [31:0] addr,
    output logic [31:0] dout
);
    always_comb begin
        case(addr)
            32'h0000: dout = addi(5'd1, 5'd0, 12'b0);
            32'h0004: dout = addi(5'd1, 5'd0, 12'b1);
            32'h0008: dout = addi(5'd1, 5'd1, 12'b1);
            32'h000c: dout = jal(5'd0, -2);
            default:  dout = addi(5'b0, 5'b0, 5'b1);
        endcase
    end
endmodule

module data_ram();
endmodule
