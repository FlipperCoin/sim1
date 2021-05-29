// 64-bit ALU test bench template
module alu64bit_test;

// Put your code here
// ------------------


logic [63:0] a;
logic [63:0] b;
logic cin;
logic [1:0] op;
logic [63:0] s;
logic cout;


alu64bit alu(.a(a),.b(b),.cin(cin),.op(op),.s(s),.cout(cout));

initial begin
    a = {64{1'b1}};
    b = {64{1'b0}};
    cin = 1'b1;
    op = 2'b10;


    #(90*64);
    cin = 1'b0;

    #(30*63+52+7);
    
    cin = 0'b1;

    #(30*63+52+5+200);
end
// End of your code

endmodule
