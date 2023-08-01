`timescale 1ns / 1ps
//10진 카운터

module dec_counter(clk, rst, cin, cout, cnt); 
    input clk;
    input rst;
    input cin;
    output cout;
    output cnt;
    parameter cnt_end = 9;
    reg [3:0] temp;
    reg cout;
    wire [3:0] cnt;
    always@(posedge clk or posedge rst) begin
        if (rst) begin
            temp <= 4'b0000;
            cout <= 0;
        end
        else begin
            if(cin)begin
                if(temp == cnt_end)begin
                    temp <= 4'b0000;
                    cout <= 1;
                end
                else begin
                    temp = temp + 1;
                    cout <= 0;
                end
            end
            else begin
                temp <= temp;
                cout <= 0;
            end
        end
    end
    
    assign cnt = temp;
    
endmodule
