module sinegen #(
    parameter   ADDRESS_WIDTH=8,
                DATA_WIDTH=8
)(
    input   logic                           clk,
    input   logic                           rst,
    input   logic                           en,
    input   logic   [ADDRESS_WIDTH-1:0]   incr,
    output  logic   [DATA_WIDTH-1:0]        dout
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
    .addr (addr),
    .clk (clk),
    .dout (dout)
);

endmodule
