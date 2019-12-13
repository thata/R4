// alu
//
// code | operations
// ------------------
// 0000 | add x
// 0001 | sub x
// 0010 | sll
// 0011 | slt
// 0100 | sltu 
// 0101 | xor x
// 0110 | srl
// 0111 | sra
// 1000 | or x
// 1001 | and x
// ------------------

module alu(
    input logic [31:0] in1, in2,
    input logic [3:0] op,
    output logic [31:0] result,
    output logic negative, zero
);
    logic [31:0] sraResult;
    logic [31:0] sltResult;
    logic [31:0] sltuResult;

    assign sraResult = $signed(in1) >>> in2;
    assign sltResult = ($signed(in1) < $signed(in2)) ? 32'b1 : 32'b0;
    assign sltuResult = (in1 < in2) ? 32'b1 : 32'b0;

    assign result = (op == 4'b0000) ? (in1 + in2)  :  // plus
                    (op == 4'b0001) ? (in1 - in2)  :  // minus
                    (op == 4'b1001) ? (in1 & in2)  :  // and
                    (op == 4'b1000) ? (in1 | in2)  :  // or
                    (op == 4'b0101) ? (in1 ^ in2)  :  // xor
                    (op == 4'b0010) ? (in1 << in2) :  // sll (shift left logical)
                    (op == 4'b0110) ? (in1 >> in2) :  // srl (shift right logical)
                    (op == 4'b0111) ? sraResult    :  // sra (shift right arithmetic)
                    (op == 4'b0011) ? sltResult    :  // slt
                    (op == 4'b0100) ? sltuResult      // sltu
                                    : 32'hxxxxxxxx;
    assign negative = result[31];
    assign zero = ~|result;

    // always @(*) begin
    //     $display("op %b", op);
    //     $display("in1 %b", in1);
    //     $display("in2 %b", in2);
    //     $display("result %b", result);
    //     $display("zero %b", zero);
    // end    
endmodule

