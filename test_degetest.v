//one trigger
module edge_detect(
input clk_i, rst_n_i, data_i, //输入端口
output posedge_o,negedge_o		//输出端口
);

//one regester
reg tri_1;

always@(posedge clk_i or negedge rst_n_i)
begin
    if (! rst_n_i)			//置位
    begin
        tri_1 <= 1'b0;
    end
    else
    begin
        tri_1 <= data_i;	//触发器
    end
end

assign negedge_o = tri_1 & (~data_i); 		//下降沿检测
assign posedge_o = (~tri_1) & data_i;     	//上升沿检测
endmodule
