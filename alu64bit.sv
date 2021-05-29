// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

logic cout_vec[63:0];
assign cout = cout_vec[63];

alu1bit alu1 (.a(a[0]), .b(b[0]), .cin(cin), .op(op), .s(s[0]), .cout(cout_vec[0]));

genvar i;
generate
    for (i = 1; i < 64; i++)
    begin
        alu1bit alu(.a(a[i]),.b(b[i]),.cin(cout_vec[i-1]),.op(op),.s(s[i]), .cout(cout_vec[i]));
    end
endgenerate


endmodule
