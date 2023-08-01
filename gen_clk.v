`timescale 1ns / 1ps
//분주기
module gen_clk( clk, rst, clk_frq );
    parameter M100hz = 100_000_000; //100,000,000
    parameter output_freq = 200; //100hz fnd의 반짝임을 없에기 위해 200hz로 했지만 카운터에는 TOP_Module에서 100hz로 2분주됨
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
