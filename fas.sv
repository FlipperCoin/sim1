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

logic g1_2;
logic g2_17;
logic g3_4;
logic g4_5;
logic g5_17;
logic g17_18;
logic g6_4;
logic g6_7 = g6_4;
logic g7_8;
logic g8_9;
logic g9_18;
logic g18_19;
logic g13_10;
logic g10_11;
logic g11_12;
logic g12_19;
logic g19_20;
logic g13_14 = g13_10;
logic g14_15;
logic g15_16;
logic g16_20;
logic g20_21;

logic g22_23;

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g1 (
    .A(cin),
    .B(b),
    .Z(g1_2)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g2 (
    .A(g1_2),
    .Z(g2_17)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g3 (
    .A(a),
    .B(b),
    .Z(g3_4)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g6 (
    .A(a_ns),
    .Z(g6_4)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g4 (
    .A(g3_4),
    .B(g6_4),
    .Z(g4_5)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g5 (
    .A(g4_5),
    .Z(g5_17)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g7 (
    .A(g6_7),
    .B(cin),
    .Z(g7_8)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g8 (
    .A(g7_8),
    .B(a),
    .Z(g8_9)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g9 (
    .A(g8_9),
    .Z(g9_18)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g13 (
    .A(a),
    .Z(g13_10)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g10 (
    .A(a_ns),
    .B(g13_10),
    .Z(g10_11)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g11 (
    .A(g10_11),
    .B(b),
    .Z(g11_12)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g12 (
    .A(g11_12),
    .Z(g12_19)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g14 (
    .A(g13_14),
    .B(cin),
    .Z(g14_15)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g15 (
    .A(g14_15),
    .B(a_ns),
    .Z(g15_16)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g16 (
    .A(g15_16),
    .Z(g16_20)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g17 (
    .A(g2_17),
    .B(g5_17),
    .Z(g17_18)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g15 (
    .A(g17_18),
    .B(g9_18),
    .Z(g18_19)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g15 (
    .A(g18_19),
    .B(g12_19),
    .Z(g19_20)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g15 (
    .A(g19_20),
    .B(g16_20),
    .Z(g20_21)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g16 (
    .A(g20_21),
    .Z(cout)
);

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g22 (
    .A(a),
    .B(b),
    .Z(g22_23)
);

XOR2 #(
    .Tpdlh(XorTpdLh),
    .Tpdhl(XorTpdHl)
) g23 (
    .A(g22_23),
    .B(cin),
    .Z(s)
);

endmodule
