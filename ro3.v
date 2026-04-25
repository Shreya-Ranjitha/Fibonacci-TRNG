module ro3(output reg out);

initial out = 0;

always begin
    #1 out = ~out;  // delay-based oscillation
end

endmodule