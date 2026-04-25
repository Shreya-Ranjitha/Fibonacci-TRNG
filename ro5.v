module ro5(output reg out);
initial out = 0;
always #2 out = ~out;
endmodule