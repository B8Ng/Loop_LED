//正向流水灯：
//输入：时钟脉冲， 复位信号
//输出：LED灯组显示信号
module ForwardFlow(
    input clk,
    input rst,
    output reg [2:0] LED_Show
);

    parameter LED1_ON = 0, LED2_ON = 1, LED3_ON = 2;

    reg [1:0] current_state, next_state;

    always @(current_state) begin
        case (current_state)
            LED1_ON: begin
                LED_Show <= 3'b001;
                next_state = LED2_ON;
            end
            LED2_ON: begin
                LED_Show <= 3'b010;
                next_state = LED3_ON;
            end
            LED3_ON: begin
                LED_Show <= 3'b100;
                next_state = LED1_ON;

            end
            default: begin
                next_state = LED1_ON;
            end 
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            current_state <= LED1_ON;
        end else begin
            current_state <= next_state;
        end
    end

endmodule
