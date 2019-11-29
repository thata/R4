// alu
//
// code and operations
// 0000: add
// 0001: sub
// 0010: sll
// 0011: slt (set on less than(slt)命令である:この命令はRs < Rtの場合は1を設定し,そうでない場合は0を設定する:)
// 0100: sltu 
// 0101: xor
// 0110: srl
// 0111: sra
// 1000: or
// 1001: and

module alu(
    input logic signed [31:0] in1, in2,
    input logic [3:0] op,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic signed [31:0] result,
    output logic negative, zero
);
    logic signed [31:0] sraResult;

    // NOTE: 三項演算子の中で算術シフトを行うとなぜか論理シフトになってしまうため、ここに持ってきた
    assign sraResult = in1 >>> in2;

    assign result = (op == 4'b0000) ? (in1 + in2)  :  // plus
                    (op == 4'b0001) ? (in1 - in2)  :  // minus
                    (op == 4'b1001) ? (in1 & in2)  :  // and
                    (op == 4'b1000) ? (in1 | in2)  :  // or
                    (op == 4'b0101) ? (in1 ^ in2)  :  // xor
                    (op == 4'b0010) ? (in1 << in2) :  // sll (shift left logical)
                    (op == 4'b0110) ? (in1 >> in2) :  // srl (shift right logical)
                    (op == 4'b0111) ? sraResult    :  // sra (shift right arithmetic)
                    (op == 4'b0011) ? 32'bX        :  // slt 予定地
                    (op == 4'b0100) ? 32'bX           // sltu 予定地
                                    : 32'hxxxxxxxx;
    assign negative = result[31];
    assign zero = ~|result;
endmodule

