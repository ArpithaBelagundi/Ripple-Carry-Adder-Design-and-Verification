// Interface for 8-bit Ripple Carry Adder

interface adder_if;
    logic [7:0] A, B;
    logic Cin;
    logic [7:0] S;
    logic Cout;
endinterface
