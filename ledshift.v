`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2019 11:09:43 AM
// Design Name: 
// Module Name: ledshift
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ledshift(
    input clk,
    output o_led1,
    output o_led2,
    output o_led3,
    output o_led4
    );
    
    reg     [24:0] counter;
    reg     [4:0] leds = 5'b00001;
    reg     state = 1'b0;

    always @(posedge clk)
    begin
        if (leds == 5'b10000)
        begin
            state <= 1'b1;
            leds <= 5'b00100;
        end
        
        if (leds == 5'b00000)
        begin
            state <= 1'b0;
            leds <= 5'b00010;
        end
        
        counter <= counter + 1'b1;
        
        if (counter >= 30000000)
        begin
            if (state == 1'b0)
                leds <= leds << 1;
            else if (state == 1'b1) 
                leds <= leds >> 1;
                
            counter <= 0;
        end
    end

    assign o_led1 = leds[0];
    assign o_led2 = leds[1];
    assign o_led3 = leds[2];
    assign o_led4 = leds[3];
endmodule


