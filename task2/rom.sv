module rom #(
    parameter   ADDRESS_WIDTH=8,
                DATA_WIDTH=8
)(
    input   logic               clk,
    input   [ADDRESS_WIDTH-1:0] addr1,
    input   [ADDRESS_WIDTH-1:0] addr2,
    output  [DATA_WIDTH-1:0]    dout,
    output  [DATA_WIDTH-1:0]    dout2
);

logic [DATA_WIDTH - 1:0] rom_array [2**ADDRESS_WIDTH - 1:0];

initial begin
            $display("Loading rom.");
            $readmemh("sinerom.mem", rom_array);
end;

always_ff @ (posedge clk) begin
    dout <= rom_array[addr1];
    dout2 <= rom_array[addr1+addr2];
end;

endmodule
