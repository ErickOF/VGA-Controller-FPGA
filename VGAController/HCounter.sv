module HCounter #(parameter MAX_H = 799)
                 (input logic clk,
						output logic v_enable,
                  output logic [int'($clog2(MAX_H)):0] h_value);

always @(posedge clk) begin
    // Count
    if (h_value < MAX_H) begin
	     h_value <= h_value + 1;
		  // Disable vertical counter
		  v_enable <= 0;
	 end
	 else begin
	     // Reset horizontal counter
	     h_value <= 0;
		  // Tigger vetical counter
		  v_enable <= 1;
	 end
end

endmodule // HCounter