`timescale 1ns / 1ps
//4개의 카운터를 instance해서 하나의 4digit counter로 형성
module digit4_counter(clk, rst, cin0, cnt0, cnt1, cnt2, cnt3, cout3);
    input clk;
    input rst;
    input cin0;
    output [3:0] cnt0;
    output [3:0] cnt1;
    output [3:0] cnt2;
    output [3:0] cnt3;
    output cout3;

    wire [3:0] cnt0;
    wire [3:0] cnt1;
    wire [3:0] cnt2;
    wire [3:0] cnt3;
    
    dec_counter U1 (.clk(clk), .rst(rst), .cin(cin0), .cout(cout0), .cnt(cnt0)); 
    dec_counter U2 (.clk(clk), .rst(rst), .cin(cout0), .cout(cout1), .cnt(cnt1));
    dec_counter U3 (.clk(clk), .rst(rst), .cin(cout1), .cout(cout2), .cnt(cnt2));
    hex_counter U4 (.clk(clk), .rst(rst), .cin(cout2), .cout(cout3), .cnt(cnt3));
    
endmodule
