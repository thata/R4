module alu(
    input logic [31:0] in1, in2,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic [31:0] out,
    output logic negative, zero
);
    assign out = funct3 == 3'b111 ? in1 & in2 :
                 funct3 == 3'b110 ? in1 | in2 :
                 funct3 == 3'b000 && funct7 == 7'b0000000 ? in1 + in2 :
                 funct3 == 3'b000 && funct7 == 7'b0100000 ? in1 - in2
                                                          : 32'hxxxxxxxx;
    assign negative = out[31];
    assign zero = ~|out;
endmodule

