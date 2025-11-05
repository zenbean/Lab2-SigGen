module counter #(
    parameter   INCREMENT_WIDTH=8,
                COUNT_WIDTH=8
)(
    input   logic   [INCREMENT_WIDTH-1:0]   incr,
    input   logic                           rst,
    input   logic                           en,
    input   logic                           clk,
    output  logic   [COUNT_WIDTH-1:0]       count
);

always_ff @(posedge clk)
    if (rst) count <= {COUNT_WIDTH{1'b0}};
    else if (en) count <= count + incr;

endmodule
