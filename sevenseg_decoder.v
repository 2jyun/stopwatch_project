`timescale 1ns / 1ps

//counter에서 BCD코드를 받아 디코딩
module sevenseg_decoder(bcd, seg_pin);
    input [3:0] bcd;
    output [6:0] seg_pin;
    reg [6:0] seg_pin;

    always @(*)begin
        case(bcd)
            4'b0000 : seg_pin <= 7'b100_0000; // 0
            4'b0001 : seg_pin <= 7'b111_1001; // 1
            4'b0010 : seg_pin <= 7'b010_0100; // 2
            4'b0011 : seg_pin <= 7'b011_0000; // 3
            4'b0100 : seg_pin <= 7'b001_1001; // 4
            4'b0101 : seg_pin <= 7'b001_0010; // 5
            4'b0110 : seg_pin <= 7'b000_0010; // 6
            4'b0111 : seg_pin <= 7'b101_1000; // 7
            4'b1000 : seg_pin <= 7'b000_0000; // 8
            4'b1001 : seg_pin <= 7'b001_0000; // 9
            default : seg_pin <= 7'b111_1111;
        endcase
    end

endmodule