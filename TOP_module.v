`timescale 1ns / 1ps
//최종 상위모듈
module TOP_module(clk, st, rst, code7, an);
    input clk;
    input st;
    input rst;
    output [6:0] code7;
    output [3:0] an;

    wire clk_frq;
    wire but_rising;
    wire cin;
    wire cout3;
    wire [6:0] code7;
    wire [3:0] an;
    wire [3:0] cnt0;
    wire [3:0] cnt1;
    wire [3:0] cnt2;
    wire [3:0] cnt3;
    wire [3:0] mux_out;
    wire [3:0] mux_sel;
    reg clk_frq2;
    gen_clk U1 ( .clk(clk), .rst(rst), .clk_frq(clk_frq) ); //100Hz Output
    but_edge U2 ( .clk(clk_frq2), .rst(rst), .start(st), .but_rising(but_rising)); //start_button
    digit4_counter U3 (.clk(clk_frq2), .rst(rst), .cin0(but_rising), .cnt0(cnt0), .cnt1(cnt1), .cnt2(cnt2), .cnt3(cnt3), .cout3(cout3)); //counter
    mux2 U4 (.clk(clk_frq), .rst(rst), .cnt0(cnt0), .cnt1(cnt1), .cnt2(cnt2), .cnt3(cnt3), .mux_out(mux_out), .mux_sel(an)); //digit multiplexer
    sevenseg_decoder U5 (.bcd(mux_out), .seg_pin(code7)); //segment decoder
    always@(posedge clk_frq or posedge rst)begin
        if(rst)begin
            clk_frq2 <= 0;
        end
        else begin
                clk_frq2 <= ~clk_frq2;
        end
    end
endmodule
