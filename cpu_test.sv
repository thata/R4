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
        // lw rd, offser(rs1)
        // instr | readData || result | instrAddr | dataAddr | writeData | we
        //  | readData || result | instrAddr | dataAddr | writeData | we
        instr = {
            12'b0, // imm
            5'b0, // rs1
            3'b010, // funct3
            5'b1, // rd
            7'b0000011 // opCode
        };
        $display(999);
    end
endmodule
