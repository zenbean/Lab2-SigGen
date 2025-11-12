module ram #(
    parameter ADDRESS_WIDTH = 9,
              DATA_WIDTH    = 8
)(
    input  logic clk,
    input  logic [ADDRESS_WIDTH-1:0] wr_addr,
    input  logic [ADDRESS_WIDTH-1:0] rd_addr,
    input  logic [DATA_WIDTH-1:0] din,
    input  logic wr_en,
    input  logic rd_en,
    output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] mem [2**ADDRESS_WIDTH-1:0];

always_ff @(posedge clk) begin
    if (wr_en)
        mem[wr_addr] <= din;

    if (rd_en)
        dout <= mem[rd_addr];
end
endmodule
