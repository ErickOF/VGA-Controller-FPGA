module VGAController (input  logic clk,
                      output logic hsync,
							 output logic vsync,
							 output logic [7:0] R,
							 output logic [7:0] G,
							 output logic [7:0] B);

// Constanst
localparam MAX_H = 799;
localparam MAX_V = 524;
localparam DIVISOR = 28'd2;

// Vars
logic condition;
logic clk_25MHz;
logic v_enable;
logic [int'($clog2(MAX_H)):0] h_value;
logic [int'($clog2(MAX_V)):0] v_value;

// Clock divider to 25MHz
ClockDivider #(DIVISOR) clk_div(.clk(clk),
                                .divided_clk(clk_25MHz));

// Horizontal Counter
HCounter #(MAX_H) h_counter(.clk(clk_25MHz),
                            .v_enable(v_enable),
									 .h_value(h_value));

// Vertical Counter
VCounter #(MAX_V) v_counter(.clk(clk_25MHz),
                            .v_enable(v_enable),
									 .v_value(v_value));

// Outputs
assign hsync = (h_value < 96) ? 1'b1 : 1'b0;
assign vsync = (v_value < 2) ? 1'b1 : 1'b0;

// Colors
assign condition = (h_value < 784 && h_value > 143 && v_value < 515 && v_value > 34);
assign R = (condition == 1'b1) ? 8'hFF : 8'h00;
assign G = (condition == 1'b1) ? 8'hFF : 8'h00;
assign B = (condition == 1'b1) ? 8'hFF : 8'h00;

endmodule // VGAController