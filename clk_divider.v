//ż����Ƶ�����ⲿ������������������Ƶϵ����Ĭ����2��Ƶ
//divdFACTOR--��Ƶϵ����ʵ�ʷ�Ƶ��ΪdivdFACTOR*2
//divdWIDTH--��Ƶ��������λ��ʵ��λ��ΪdivdWIDTH+1,��λ�����ܱ������ֵ>divdFACTOR
module clk_divider(
	input RST,
	input CLK_In,
	output reg CLK_Out
);
	parameter divdWIDTH=1;//��Ƶ��������λ��ʵ��λ��ΪdivdWIDTH+1,��λ�����ܱ������ֵ>divdFACTOR
	parameter divdFACTOR=1;//��Ƶϵ����divdFACTOR*2
	reg [divdWIDTH:0] cnt;

	always @ (negedge RST or posedge CLK_In)
		if(RST==1'b0)
			begin
			cnt=0;
			CLK_Out=0;
			end
		else
			begin
			cnt=cnt+1'b1;//����1Ҫָ��λ��������Ĭ����32λ��
			if(cnt>=divdFACTOR)
				begin
				cnt=0;
				CLK_Out=~CLK_Out;
				end 
			end

endmodule 
