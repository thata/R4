// lw rd, imm(rs1)
// rd = M[rs1+imm]
function [31:0] lw(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
);
    lw = {
        imm,
        rs1,
        3'b010, // funct3
        rd,
        7'b0000011 // opCode
    };
endfunction

// sw rs2, imm(rs1)
// M[rs1+imm] = rs2
function [31:0] sw(
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    input logic [11:0] imm
);
    sw = {
        imm[11:5],
        rs2,
        rs1,
        3'b010, // funct3
        imm[4:0],
        7'b0100011 // opCode
    };
endfunction

// add rd, rs1, rs2
// rd = rs1 + rs2
function [31:0] add(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    add = {
        7'b0, // funct7
        rs2,
        rs1,
        3'b000, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction
