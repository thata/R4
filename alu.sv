module alu(
    input logic signed [31:0] in1, in2,
    // input logic [3:0] op を追加したい
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic signed [31:0] result,
    output logic negative, zero
);
    logic signed [31:0] sraResult;

    // NOTE: 三項演算子の中で算術シフトを行うとなぜか論理シフトになってしまうため、ここに持ってきた
    assign sraResult = in1 >>> in2;

    // RV32IのR形式の命令
    // 0000. add
    // 0001. sub
    // 0010. sll
    // 0011. slt (set on less than(slt)命令である.この命令はRs < Rtの場合は1を設定し,そうでない場合は0を設定する.)
    // 0100. sltu 
    // 0101. xor
    // 0110. srl
    // 0111. sra
    // 1000. or
    // 1001. and
    assign result = (funct3 == 3'b111) ? (in1 & in2) : // and
                    (funct3 == 3'b110) ? (in1 | in2) : // or
                    (funct3 == 3'b100) ? (in1 ^ in2) : // xor
                    (funct3 == 3'b001) ? (in1 << in2) : // shift left logically
                    (funct3 == 3'b101 && funct7 == 7'b0000000) ? (in1 >> in2) : // shift right logical
                    (funct3 == 3'b101 && funct7 == 7'b0100000) ? sraResult :    // shift right arithmetic
                    (funct3 == 3'b000 && funct7 == 7'b0000000) ? (in1 + in2) :  // plus
                    (funct3 == 3'b000 && funct7 == 7'b0100000) ? (in1 - in2)    // minus
                                                             : 32'hxxxxxxxx;
    assign negative = result[31];
    assign zero = ~|result;
endmodule

