module sigdelay #(
    parameter ADDRESS_WIDTH = 9,
              DATA_WIDTH    = 8
)(
    input  logic clk,
    input  logic rst,
    input  logic wr,       // wr_en
    input  logic rd,       // rd_en
    input  logic [ADDRESS_WIDTH-1:0] offset,
    input  logic [DATA_WIDTH-1:0] mic_signal,
    output logic [DATA_WIDTH-1:0] delayed_signal
);

logic [ADDRESS_WIDTH-1:0] wr_addr;
logic [ADDRESS_WIDTH-1:0] rd_addr;

// counter for write address
always_ff @(posedge clk or posedge rst) begin
    if (rst)
        wr_addr <= 0;
    else if (wr)
        wr_addr <= wr_addr + 1;
end

// generate read address with offset
always_comb begin
        rd_addr = wr_addr - offset;
end

ram myRam (
    .clk(clk),
    .wr_addr(wr_addr),
    .rd_addr(rd_addr),
    .din(mic_signal),
    .wr_en(wr),
    .rd_en(rd),
    .dout(delayed_signal)
);

endmodule
