// 4->1 multiplexer test bench template
module mux4_test;

logic d0;
logic d1;
logic d2;
logic d3;
logic sel[1:0];
logic z;

mux2 m4(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.sel(sel),.z(z));

initial begin


end


endmodule
