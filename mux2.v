`timescale 1ns / 1ps
//multiplexer를 이용해 FND 동적제어
module mux2 (clk, rst, cnt0, cnt1, cnt2, cnt3, mux_out, mux_sel);
    input clk;
    input rst;
    input [3:0]cnt0;
    input [3:0]cnt1;
    input [3:0]cnt2;
    input [3:0]cnt3;
    output [3:0] mux_out;
    output [3:0] mux_sel;
    
    wire [3:0] cnt0, cnt1, cnt2, cnt3;

    reg [3:0] mux_out, mux_sel;
    reg [1:0] mux_cnt;

    always@(posedge clk or posedge rst) begin //fnd counter
        if(rst) begin mux_cnt <= 2'b00;        end
        else    begin mux_cnt <= mux_cnt +1;   end
    end
    
    always @ ( mux_cnt ) begin
     case ( mux_cnt ) 
      2'b00: begin mux_out <= cnt0; mux_sel <= 4'b1110; end
      2'b01: begin mux_out <= cnt1; mux_sel <= 4'b1101; end
      2'b10: begin mux_out <= cnt2; mux_sel <= 4'b1011; end    
      2'b11: begin mux_out <= cnt3; mux_sel <= 4'b0111; end     
      endcase
   end   

endmodule
