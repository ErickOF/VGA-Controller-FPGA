module VGAControllerTest;

logic clk, hsync, vsync;
logic [7:0] R, G, B;

VGAController DUT(.clk(clk),
                  .hsync(hsync),
						.vsync(vsync),
						.R(R),
						.G(G),
						.B(B));

initial begin
	clk = 0;
end

always
begin
	#10 clk = ~clk;
end

endmodule // VGAControllerTest
