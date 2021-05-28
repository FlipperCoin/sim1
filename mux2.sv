// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

localparam OrTpdLh = 4;
localparam OrTpdHl = 4;
localparam NotTpdLh = 10;
localparam NotTpdHl = 8;
localparam XorTpdLh = 7;
localparam XorTpdHl = 5;

logic g1_2;
logic g2_6;
logic g6_7;
logic g3_4;
logic g4_5;
logic g5_6;

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g1 (
    .A(d0),
    .B(sel),
    .Z(g1_2)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g2 (
    .A(g1_2),
    .Z(g2_6)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g3 (
    .A(sel),
    .Z(g3_4)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g4 (
    .A(g3_4),
    .B(d1),
    .Z(g4_5)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g5 (
    .A(g4_5),
    .Z(g5_6)
);

OR2 #(
    .Tpdlh(OrTpdLh),
    .Tpdhl(OrTpdHl)
) g6 (
    .A(g2_6),
    .B(g5_6),
    .Z(g6_7)
);

NOT #(
    .Tpdlh(NotTpdLh),
    .Tpdhl(NotTpdHl)
) g7 (
    .A(g6_7),
    .Z(z)
);

endmodule
