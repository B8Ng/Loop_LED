//���뿪�ؿ���ģ��:
//|  000  |    off     |
//|  001  |  ����2hz   |
//|  010  |  ����2hz   |
//|  011  |  ����5hz   |
//|  100  |  ����5hz   |
//|  101  |  ����11hz  |
//|  110  |  ����11hz  |
//|  111  |    off     |
module Control(
	input [2:0] ctrl,
    input [2:0] input_signal_1,
    input [2:0] input_signal_2,
    input [2:0] input_signal_3,
    input [2:0] input_signal_4,
    input [2:0] input_signal_5,
    input [2:0] input_signal_6,
    output reg [2:0] output_signal
);

    always @(*) begin
        case (ctrl)
            3'b000: output_signal <= 3'b000;
            3'b001: output_signal <= input_signal_1;
            3'b010: output_signal <= input_signal_2;
            3'b011: output_signal <= input_signal_3;
            3'b100: output_signal <= input_signal_4;
            3'b101: output_signal <= input_signal_5;
            3'b110: output_signal <= input_signal_6;
            default: output_signal = 3'b000;
        endcase
    end

endmodule
