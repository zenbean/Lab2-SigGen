module sinegen #(
    parameter   ADDRESS_WIDTH=8,
                DATA_WIDTH=8
)(
    input   logic                           clk,
    input   logic                           rst,
    input   logic                           en,
    input   logic   [ADDRESS_WIDTH-1:0]     incr,
    input   logic   [ADDRESS_WIDTH-1:0]     phase,
    output  logic   [DATA_WIDTH-1:0]        dout,
    output  logic   [DATA_WIDTH-1:0]        dout2
);

    logic [ADDRESS_WIDTH-1:0]   addr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (addr)
);

rom sineRom (
    .addr1 (addr),
    .addr2 (phase),
    .clk (clk),
    .dout (dout),
    .dout2 (dout2)
);

endmodule
