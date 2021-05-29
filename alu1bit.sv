// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

localparam OrTpdLh = 4;
localparam OrTpdHl = 4;
localparam NotTpdLh = 10;
localparam NotTpdHl = 8;
localparam XorTpdLh = 7;
localparam XorTpdHl = 5;

logic g1_2;
logic g2_d0;
logic g3_d1;
logic g4_a_ns;
logic s_d2;
logic s_d3 = s_d2;

fas(.a(a),.b(b),.a_ns(g4_a_ns),.s(s_d2),.cout(cout));
mux4(.d0(g2_d0),.d1(g3_d1),.d2(s_d2),.d3(s_d3),.sel(op),.z(s));

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g1 (
    .A(a),
    .B(b),
    .Z(g1_2)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g2 (
    .A(g1_2),
    .Z(g2_d0)
);

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g3 (
    .A(a),
    .B(b),
    .Z(g3_d1)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g4 (
    .A(op[0]),
    .Z(g4_a_ns)
);

endmodule
