`timescale 1ns / 1ps
//���ֱ�
module gen_clk( clk, rst, clk_frq );
    parameter M100hz = 100_000_000; //100,000,000
    parameter output_freq = 200; //100hz fnd�� ��¦���� ������ ���� 200hz�� ������ ī���Ϳ��� TOP_Module���� 100hz�� 2���ֵ�
    parameter clk_hilow_cnt_value = ((M100hz / output_freq)/2)-1;
    input clk;
    input rst;
    output clk_frq;
    reg clk_frq;
    reg [31:0] clk_cnt;
    
    always @(posedge clk or posedge rst) begin
        if(rst)begin
            clk_cnt <= 32'h0000_0000;
            clk_frq <= 0;
        end
        else begin
            if(clk_cnt == clk_hilow_cnt_value)begin
                clk_cnt <= 32'h0000_0000;
                clk_frq <= ~clk_frq;
            end
            else begin
                clk_cnt[31:0] <= clk_cnt[31:0]+1;
            end
        end
    end
endmodule
