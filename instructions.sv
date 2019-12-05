
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
