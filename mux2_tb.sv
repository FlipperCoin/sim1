// 2->1 multiplexer template
module mux2_tb;

logic d0;
logic d1;
logic sel;
logic z;

mux2 m2(.d0(d0),.d1(d1),.sel(sel),.z(z));

initial begin
    d0 = 1'b0;
    d1 = 1'b0;
    sel = 1'b0;

    #36;
    d0 = 1'b1;
    d1 = 1'b0;
    sel = 1'b0;

    #36;
    d0 = 1'b0;
    d1 = 1'b1;
    sel = 1'b0;
    
    #36;
    d0 = 1'b1;
    d1 = 1'b1;
    sel = 1'b0;
    
    #36;
    d0 = 1'b0;
    d1 = 1'b0;
    sel = 1'b1;
    
    #36;
    d0 = 1'b1;
    d1 = 1'b0;
    sel = 1'b1;
    
    #36;
    d0 = 1'b0;
    d1 = 1'b1;
    sel = 1'b1;
    
    #36;
    d0 = 1'b1;
    d1 = 1'b1;
    sel = 1'b1;

    #36;
end

endmodule
