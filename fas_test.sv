// Full Adder/Subtractor test bench template
module fas_test;

logic a;
logic b;
logic cin;
logic a_ns;
logic s;
logic cout;

fas fs(.a(a), .b(b), .cin(cin), .a_ns(a_ns), .s(s), .cout(cout));

initial begin
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    a_ns = 1'b0;

    #14;
    
    a = 1'b1;
    b = 1'b0;
    cin = 1'b0;
    a_ns = 1'b0;

    #14;
    
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    a_ns = 1'b0;

    #10;
end

endmodule
