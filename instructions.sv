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

// addi rd, rs1, immediate
// rd = rs1 + immediate
function [31:0] addi(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
);
    addi = {
        imm,
        rs1,
        3'b000, // funct3
        rd,
        7'b0010011 // opCode
    };
endfunction

// sub rd, rs1, rs2
// rd = rs1 - rs2
function [31:0] sub(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    sub = {
        7'b0100000, // funct7
        rs2,
        rs1,
        3'b000, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// and rd, rs1, rs2
// rd = rs1 & rs2
function [31:0] _and(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    _and = {
        7'b0000000, // funct7
        rs2,
        rs1,
        3'b111, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// or rd, rs1, rs2
// rd = rs1 | rs2
function [31:0] _or(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    _or = {
        7'b0000000, // funct7
        rs2,
        rs1,
        3'b110, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// xor rd, rs1, rs2
// rd = rs1 ^ rs2
function [31:0] _xor(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    _xor = {
        7'b0000000, // funct7
        rs2,
        rs1,
        3'b100, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// slt rd, rs1, rs2
// rd = (rs1 < rs2) ? 1 : 0
function [31:0] slt(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    slt = {
        7'b0000000, // funct7
        rs2,
        rs1,
        3'b010, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// sltu rd, rs1, rs2
// rd = (rs1 < rs2) ? 1 : 0
function [31:0] sltu(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [4:0] rs2
);
    sltu = {
        7'b0000000, // funct7
        rs2,
        rs1,
        3'b011, // funct3
        rd,
        7'b0110011 // opCode
    };
endfunction

// beq rs1, rs2, imm
function [31:0] beq(
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    input logic [11:0] imm
);
    beq = {
        imm[11],
        imm[9:4],
        rs2,
        rs1,
        3'b000, // funct3
        imm[3:0],
        imm[10],
        7'b1100011 // opCode
    };
endfunction

// jal rd, offset
function [31:0] jal(
    input logic [4:0] rd,
    input logic [19:0] imm
);
    jal = {
        imm[19],
        imm[9:0],
        imm[10],
        imm[18:11],
        rd,
        7'b1101111 // opCode
    };
endfunction

// jalr rd, offset(rs1)
function [31:0] jalr(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
);
    jalr = {
        imm[11:0],
        rs1,
        3'b000,
        rd,
        7'b1100111 // opCode
    };
endfunction

// lui rd, imm
function [31:0] lui(
    input logic [4:0] rd,
    input logic [19:0] imm
);
    lui = {
        imm,
        rd,
        7'b0110111 // opCode
    };
endfunction

// ori rd, rs1, immediate
// rd = rs1 | immediate
function [31:0] ori(
    input logic [4:0] rd,
    input logic [4:0] rs1,
    input logic [11:0] imm
);
    ori = {
        imm,
        rs1,
        3'b110, // funct3
        rd,
        7'b0010011 // opCode
    };
endfunction
