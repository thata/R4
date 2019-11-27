module regfile(
    input logic clk, we3,
    input logic [5:0] addr1, addr2, addr3,
    input logic [31:0] writeData3,
    output logic [31:0] readData1, readData2
);

    // $0 へは書き込めるけど参照しても常に 0 が返る
    logic [31:0] registers [0:31];

    assign readData1 = (addr1 === 6'b0) ? 32'b0 : registers[addr1];
    assign readData2 = (addr2 === 6'b0) ? 32'b0 : registers[addr2];

    always_ff @(posedge clk) begin
        if (we3)
            registers[addr3] <= writeData3;
    end
endmodule
