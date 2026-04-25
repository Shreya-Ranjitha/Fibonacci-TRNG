module fibonacci_selector (
    input clk,
    input reset,
    output reg [1:0] sel
);

reg [1:0] a = 1, b = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        a <= 1;
        b <= 0;
        sel <= 0;
    end else begin
        sel <= (a + b) % 4;
        b <= a;
        a <= sel;
    end
end

endmodule