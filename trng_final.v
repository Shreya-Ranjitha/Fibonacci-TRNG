module trng_final (
    input clk,
    input reset,
    output wire random_bit
);

wire [3:0] ro;
wire [1:0] sel;
wire entropy;

// Oscillators
ro_bank bank(ro);

// Fibonacci selector
fibonacci_selector fib_sel (
    .clk(clk),
    .reset(reset),
    .sel(sel)
);

// XOR + selection
wire selected = ro[sel];
`ifdef SIMULATION
assign entropy = ro[0] ^ ro[1] ^ ro[2] ^ ro[3] ^ selected ^ ($urandom % 2);
`else
assign entropy = ro[0] ^ ro[1] ^ ro[2] ^ ro[3] ^ selected;
`endif

// Adaptive sampling
adaptive_sampler sampler (
    .clk(clk),
    .reset(reset),
    .entropy_in(entropy),
    .sampled_bit(random_bit)
);

endmodule