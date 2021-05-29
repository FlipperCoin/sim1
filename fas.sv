// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

localparam OrTpdLh = 4;
localparam OrTpdHl = 4;
localparam NotTpdLh = 10;
localparam NotTpdHl = 8;
localparam XorTpdLh = 7;
localparam XorTpdHl = 5;

logic g1_3;
logic g2_3;
logic g3_4;
logic g4_5;
logic g6_7;
logic g7_8;
logic g8_9;
logic g9_5;
logic g11_12;

// cout path

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g1 (
    .A(cin),
    .Z(g1_3)
);


NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g2 (
    .A(b),
    .Z(g2_3)
);


OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g3 (
    .A(g1_3),
    .B(g2_3),
    .Z(g3_4)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g4 (
    .A(g3_4),
    .Z(g4_5)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g6 (
    .A(c_in),
    .B(b),
    .Z(g6_7)
);

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g10 (
    .A(a_ns),
    .B(a),
    .Z(g10_8)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g7 (
    .A(g6_7),
    .Z(g7_8)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g8 (
    .A(g7_8),
    .B(g10_8),
    .Z(g8_9)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g9 (
    .A(g8_9),
    .Z(g9_5)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g5 (
    .A(g9_5),
    .B(g4_5),
    .Z(cout)
);

// s path

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g11 (
    .A(a),
    .B(b),
    .Z(g11_12)
);

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g12 (
    .A(g11_12),
    .B(cin),
    .Z(s)
);


endmodule
