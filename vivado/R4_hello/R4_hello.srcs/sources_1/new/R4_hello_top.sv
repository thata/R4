`include "../../../../../instructions.sv"

module R4_hello_top(
    input logic clk,
    input logic [15:0] sw,
    output logic [15:0] led
);    
    logic n_reset = 1;
    logic [31:0] instr;
    logic [31:0] readData;
    logic [31:0] result;
    logic [31:0] instrAddr;
    logic [31:0] dataAddr;
    logic [31:0] writeData;
    logic we;
    logic [31:0] peek;

    // peek
    assign led = peek[15:0];

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

    r4_hello_test_rom _rom(
        instrAddr,
        instr
    );

    r4_hello_ram _ram(
        clk,
        dataAddr,
        writeData,
        we,
        readData,
        peek
    );    
endmodule

module r4_hello_test_rom(
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

module r4_hello_ram(
    input clk,
    input logic [31:0] addr, din,
    input logic we,
    output logic [31:0] dout,
    output logic [31:0] peek
);

    logic [32:0] mem [4095:0]; // 12bit
//    logic [32:0] mem [255:0]; // 8bit

    assign dout = mem[addr];
    assign peek = mem[0];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= din;
    end
endmodule
