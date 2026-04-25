module adaptive_sampler (
    input clk,
    input reset,
    input entropy_in,
    output reg sampled_bit
);

reg [15:0] fib1 = 1, fib2 = 1;
reg [15:0] counter = 0;
reg [15:0] target = 1;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        fib1 <= 1;
        fib2 <= 1;
        target <= 1;
        counter <= 0;
    end else begin
        counter <= counter + 1;

        if (counter >= target) begin
            sampled_bit <= entropy_in;

            // next Fibonacci
            target <= fib1 + fib2;
            fib2 <= fib1;
            fib1 <= target;

            counter <= 0;
        end
    end
end

endmodule