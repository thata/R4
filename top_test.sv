// TOP testbench
// iverilog -g 2012 -s top_test *.sv && ./a.out 

`include "instructions.sv"

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
    logic [31:0] peek;

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

    ram _ram(
        clk,
        dataAddr,
        writeData,
        we,
        readData,
        peek
    );

    initial begin
        n_reset = 0;
        #10;
        n_reset = 1;
    end

    always #5 begin
        // $display("pc %x", instrAddr);
        // $display("result %x", result);

        clk <= !clk;
        
        if ($time > 1000000) begin
            assert (
                peek == 32'h000000ff
            ) $display("PASSED"); else $display("FAILED %h", peek);

            $finish;
        end
    end
endmodule

module test_rom(
    input logic [31:0] addr,
    output logic [31:0] dout
);
    always_comb begin
        case(addr)
            // addi $1, $0, 0
            32'h0000: dout = addi(5'd1, 5'd0, 0);
            // addi $2, $0, 255
            32'h0004: dout = addi(5'd2, 5'd0, 255);
            // LOOP: beq $2, $0, BREAK
            32'h0008: dout = beq(5'd2, 5'd0, 8);
            // addi $1, $1, 1
            32'h000C: dout = addi(5'd1, 5'd1, 1);
            // addi $2, $2, -1
            32'h0010: dout = addi(5'd2, 5'd2, -1);
            // jal $0, LOOP
            32'h0014: dout = jal(5'd0, -6);
            // BREAK: sw $1, 0($0)
            32'h0018: dout = sw(5'd0, 5'd1, 12'b0);
            // FIN: jal $0, FIN
            32'h0020: dout = jal(5'd0, 0);
            default:  dout = addi(5'b0, 5'b0, 5'b0);
        endcase
    end
endmodule

module ram(
    input clk,
    input logic [31:0] addr, din,
    input logic we,
    output logic [31:0] dout,
    output logic [31:0] peek
);

    logic [32:0] mem [255:0];

    assign dout = mem[addr];
    assign peek = mem[0];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= din;
    end
endmodule
