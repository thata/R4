`include "../../../../../instructions.sv"

module R4_hello_top(
    input logic clk,
    input logic [15:0] sw,
    output logic [15:0] led
);    
    logic n_reset = 1;
    logic cpu_clk;
    logic [31:0] instr;
    logic [31:0] readData;
    logic [31:0] result;
    logic [31:0] instrAddr;
    logic [31:0] dataAddr;
    logic [31:0] writeData;
    logic we;
    logic [31:0] peek;
    logic [31:0] led_buffer = 32'b0;

    // peek
    assign led = led_buffer;
    always_ff @(posedge cpu_clk) begin
        led_buffer <= peek;
    end

    // clock
    clk_10mhz instance_name(
        .clk_out1(cpu_clk),
        // .reset(0),
        //.locked(locked),
        .clk_in1(clk)
    );
    
    cpu _cpu(
        cpu_clk,
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
        cpu_clk,
        dataAddr,
        writeData,
        we,
        readData,
        peek
    );    
endmodule

// fib(10) == 55
module r4_hello_test_rom(
    input logic [31:0] addr,
    output logic [31:0] dout
);

 always_comb begin
        case(addr)
            // a = 0
            // addi $1, $0, 0
            32'h0000: dout = addi(5'd1, 5'd0, 0);
            // b = 1
            // addi $2, $0, 0
            32'h0004: dout = addi(5'd2, 5'd0, 1);
            // c = 0
            // addi $3, $0, 0
            32'h0008: dout = addi(5'd3, 5'd0, 0);
            // i = 0
            // addi $4, $0, 0
            32'h000C: dout = addi(5'd4, 5'd0, 0);
            // n = 10
            // addi $5, $0, 10
            32'h0010: dout = addi(5'd5, 5'd0, 10);
            // LOOP: slt $6, $4, $5
            32'h0014: dout = slt(5'd6, 5'd4, 5'd5);
            // beq $6, $0, BREAK (6命令 -> 24バイト -> 12)
            32'h0018: dout = beq(5'd6, 5'd0, 12);
            // a = b
            // $add $1, $0, $2
            32'h001C: dout = add(5'd1, 5'd0, 5'd2);
            // b = c
            // $add $2, $0, $3
            32'h0020: dout = add(5'd2, 5'd0, 5'd3);
            // c = a + b
            // $add $3, $1, $2
            32'h0024: dout = add(5'd3, 5'd1, 5'd2);
            // i = i + 1
            // $addi $4, $4, 1
            32'h0028: dout = addi(5'd4, 5'd4, 1);
            // jal $0, LOOP (-6命令 -> -24バイト -> -12)
            32'h002C: dout = jal(5'd0, -12);
            // BREAK: sw $3, 0($0)
            32'h0030: dout = sw(5'd0, 5'd3, 12'b0);
            // FIN: jal $0, FIN
            32'h0034: dout = jal(5'd0, 0);
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

//    logic [32:0] mem [4095:0]; // 12bit
    logic [32:0] mem [255:0]; // 8bit

    assign dout = mem[addr];
    assign peek = mem[0];

    always_ff @(posedge clk) begin
        if (we)
            mem[addr] <= din;
    end
endmodule
