module sword (input logic sw, clk, reset, output logic v);

logic curr_state, next_state;

assign next_state = (!curr_state && sw && !reset) || (curr_state && !reset);

d_ff sw_flop(.d(next_state), .clk(clk), .q(curr_state));

assign v = curr_state;

endmodule