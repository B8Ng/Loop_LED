//偶数分频器，外部带入两个参数决定分频系数。默认是2分频
//divdFACTOR--分频系数，实际分频数为divdFACTOR*2
//divdWIDTH--分频计数器的位宽，实际位宽为divdWIDTH+1,该位宽所能表达的最大值>divdFACTOR
module clk_divider(
	input RST,
	input CLK_In,
	output reg CLK_Out
);
	parameter divdWIDTH=1;//分频计数器的位宽，实际位宽为divdWIDTH+1,该位宽所能表达的最大值>divdFACTOR
	parameter divdFACTOR=1;//分频系数是divdFACTOR*2
	reg [divdWIDTH:0] cnt;

	always @ (negedge RST or posedge CLK_In)
		if(RST==1'b0)
			begin
			cnt=0;
			CLK_Out=0;
			end
		else
			begin
			cnt=cnt+1'b1;//常数1要指定位数，否则默认是32位的
			if(cnt>=divdFACTOR)
				begin
				cnt=0;
				CLK_Out=~CLK_Out;
				end 
			end

endmodule 
