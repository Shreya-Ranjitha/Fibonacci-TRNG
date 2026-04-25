module ro7(output reg out);
initial out = 0;
always #3 out = ~out;
endmodule