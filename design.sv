//RCA Design

module ripple_carry_adder_8bit (
    input  [7:0] A,  // 8-bit input A
    input  [7:0] B,  // 8-bit input B
    input  Cin,      // Carry-in
    output  [7:0] S, // 8-bit sum output
    output  Cout     // Final carry-out
);
    wire [7:0] carry; // Internal carry signals

    // Instantiate the first full adder
    full_adder fa0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .S(S[0]),
        .Cout(carry[0])
    );

    // Instantiate the remaining full adders
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : adder_loop
            full_adder fa (
                .A(A[i]),
                .B(B[i]),
                .Cin(carry[i-1]),
                .S(S[i]),
                .Cout(carry[i])
            );
        end
    endgenerate

    // Final carry-out
    assign Cout = carry[7];
endmodule

module full_adder (
    input  A,      // Input bit A
    input  B,      // Input bit B
    input  Cin,    // Carry-in
    output  S,     // Sum
    output  Cout   // Carry-out
);
    assign S = A ^ B ^ Cin;                // Sum calculation
    assign Cout = (A & B) | (Cin & (A ^ B)); // Carry-out calculation
endmodule
