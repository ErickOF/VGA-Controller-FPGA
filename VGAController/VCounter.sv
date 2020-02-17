module VCounter #(parameter MAX_V = 524)
                 (input logic clk,
					   input logic v_enable,
                  output logic [int'($clog2(MAX_V)):0] v_value);

always @(posedge clk) begin
    if (v_enable == 1'b1) begin
        if (v_value < MAX_V) begin
	         v_value <= v_value + 1;
	     end
	     else begin
	         // Reset counter
	         v_value <= 0;
	     end
    end
end

endmodule // VCounter