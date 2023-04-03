module tb_test(
    );

reg clk_i,rst_n_i,data_i;
wire posedge_o, negedge_o;

//模块调用
edge_detect u1(
.clk_i(clk_i),
.rst_n_i(rst_n_i),
.data_i(data_i),
.posedge_o(posedge_o),
.negedge_o(negedge_o)
);

//initial
initial begin
clk_i = 0;
rst_n_i = 0;
#10
rst_n_i = 1;
data_i = 0;
#13
data_i = 1; 	//上升沿
#20
data_i = 0;		//下降沿
#15
data_i = 1;		//上升沿
#10
data_i = 0;		//下降沿
end

//clk 信号
always #5 clk_i = ~clk_i;

endmodule
