module ro9(output reg out);
initial out = 0;
always #4 out = ~out;
endmodule