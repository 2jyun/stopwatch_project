`timescale 1ns / 1ps
//start, stop 스위치를 토글 스위치로 만들기 위한 코드

module but_edge( clk, rst, start, but_rising );
    input clk;
    input rst;
    input start;
    output but_rising;
    reg reg_a, reg_b, but_rising;

    always@(posedge clk or posedge rst) begin
        if(rst)begin
            reg_a <= 0;
            reg_b <= 0;
        end
        else begin
            reg_a <= start;
            reg_b <= reg_a;
        end
    end

    always @(posedge clk or posedge rst) begin
        if(rst) but_rising <= 1;
        else if(reg_a && ~reg_b ) but_rising <= ~but_rising;
        else but_rising <= but_rising;
    end
endmodule
