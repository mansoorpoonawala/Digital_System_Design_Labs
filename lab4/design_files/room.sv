module room (input logic clk, n, s, e, w, v, reset, output logic s6, win, s5, d, s4, s3, sw, s2, s1, s0);

logic s0_next, s1_next, s2_next, s3_next, s4_next, s5_next, s6_next;

assign s0_next = reset || (s0 && !(e)) || (s1 && win);
assign s1_next = (s0 && e && ~reset) || (s2 && n && ~reset) || (s1 && ~(w || s));
assign s2_next = (s1 && s && ~reset) || (s3 && e && ~reset) || (s2 && ~(n || w || e));
assign s3_next = (s2 && w && ~reset) || (s3 && ~(e));
assign s4_next = (s2 && s && e && ~reset);
assign s5_next = (s4 && ~v && ~reset);
assign s6_next = (s4 && v && ~reset);
assign sw = s3;
assign d = s5;
assign win = s6;

d_ff s0_flop (.d(s0_next), .clk(clk), .q(s0));
d_ff s1_flop (.d(s1_next), .clk(clk), .q(s1));
d_ff s2_flop (.d(s2_next), .clk(clk), .q(s2));
d_ff s3_flop (.d(s3_next), .clk(clk), .q(s3));
d_ff s4_flop (.d(s4_next), .clk(clk), .q(s4));
d_ff s5_flop (.d(s5_next), .clk(clk), .q(s5));
d_ff s6_flop (.d(s6_next), .clk(clk), .q(s6));
endmodule
