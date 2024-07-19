module Loop_LED(
	input CLK_In,				//系统晶振
    input [2:0]Ctrl,			//拨码开关
    input RST,
    output wire [2:0] LED_Out	//LED灯组
);

wire clk_2hz, clk_5hz, clk_11hz;
wire [2:0] ForwardOut_2hz, ReverseOut_2hz;
wire [2:0] ForwardOut_5hz, ReverseOut_5hz;
wire [2:0] ForwardOut_11hz, ReverseOut_11hz;
//2hz分频器
clk_divider CLK_Divider_2hz(.RST(RST), .CLK_In(CLK_In), .CLK_Out(clk_2hz));
defparam CLK_Divider_2hz.divdWIDTH = 24, CLK_Divider_2hz.divdFACTOR = 12000000;
//5hz分频器
clk_divider CLK_Divider_5hz(.RST(RST), .CLK_In(CLK_In), .CLK_Out(clk_5hz));
defparam CLK_Divider_5hz.divdWIDTH = 23, CLK_Divider_5hz.divdFACTOR = 4800000;
//11hz分频器
clk_divider CLK_Divider_11hz(.RST(RST), .CLK_In(CLK_In), .CLK_Out(clk_11hz));
defparam CLK_Divider_11hz.divdWIDTH = 22, CLK_Divider_11hz.divdFACTOR = 2181818;
//正向流水灯2hz, 5hz, 11hz
ForwardFlow Forward_2hz(.clk(clk_2hz), .rst(RST), .LED_Show(ForwardOut_2hz));
ForwardFlow Forward_5hz(.clk(clk_5hz), .rst(RST), .LED_Show(ForwardOut_5hz));
ForwardFlow Forward_11hz(.clk(clk_11hz), .rst(RST), .LED_Show(ForwardOut_11hz));
//反向流水灯2hz, 5hz, 11hz
ReverseForwardFlow Reverse_2hz(.clk(clk_2hz), .rst(RST), .LED_Show(ReverseOut_2hz));
ReverseForwardFlow Reverse_5hz(.clk(clk_5hz), .rst(RST), .LED_Show(ReverseOut_5hz));
ReverseForwardFlow Reverse_11hz(.clk(clk_11hz), .rst(RST), .LED_Show(ReverseOut_11hz));

Control Control(.ctrl(Ctrl), .input_signal_1(ForwardOut_2hz), .input_signal_2(ReverseOut_2hz), .input_signal_3(ForwardOut_5hz), .input_signal_4(ReverseOut_5hz), .input_signal_5(ForwardOut_11hz), .input_signal_6(ReverseOut_11hz), .output_signal(LED_Out));


endmodule
