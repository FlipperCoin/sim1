module alu1bit_test;

logic a;
logic b;
logic cin;
logic [1:0] op;
logic s;
logic cout;

alu1bit alu1bit(.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));

initial begin
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    op = {2'b10};

    #90;
    
    a = 1'b1;
    b = 1'b0;
    cin = 1'b0;
    op = {2'b10};

    #66;
    
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    op = {2'b10};

    #62;
    #20;
end

endmodule
