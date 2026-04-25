module tb;

reg clk = 0;
reg reset = 1;
wire random_bit;

integer file;
integer seed;

// DUT
trng_final uut (
    .clk(clk),
    .reset(reset),
    .random_bit(random_bit)
);

// --------------------
// TRUE DIFFERENT SEED EVERY RUN
// --------------------
initial begin
    seed = $time + $urandom;
end

// --------------------
// CLOCK WITH RANDOM JITTER
// --------------------
always begin
    #(5 + ($urandom % 5)) clk = ~clk;
end

// --------------------
// FILE OPEN
// --------------------
initial begin
    file = $fopen("random_bits.txt", "w");
    #20 reset = 0;
end

// --------------------
// WRITE ONLY VALID VALUES
// --------------------
always @(posedge clk) begin
    if (random_bit === 1'b0 || random_bit === 1'b1)
        $fwrite(file, "%0d\n", random_bit);
end

// --------------------
// STOP
// --------------------
initial begin
    #10000;
    $fclose(file);
    $stop;
end

endmodule