module game (input logic clk, n, s, e, w, reset, output logic s6, s5, s4, s3, s2, s1, s0, v, sw, d, win);
logic sw_signal;
room room1 (.clk(clk), .n(n), .s(s), .e(e), .w(w), .v(v), .reset(reset), .s6(s6), .s5(s5), .s4(s4), .s3(s3), .s2(s2),
				.s1(s1), .s0(s0), .d(d), .win(win), .sw(sw_signal));
				
sword sword1 (.clk(clk), .reset(reset), .sw(sw_signal), .v(v));
assign sw = sw_signal;
endmodule