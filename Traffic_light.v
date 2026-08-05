`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 07:41:52 AM
// Design Name: 
// Module Name: Traffic_light
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


module Traffic_light(
    input clk,
    input reset,
    input ped,
    output reg NS_G,
    output reg NS_Y,
    output reg NS_R,
    output reg EW_G,
    output reg EW_Y,
    output reg EW_R,
    output reg PD_G,
    output reg PD_R
    );
    parameter S0=3'd0;
    parameter S1=3'd1;
    parameter S2=3'd2;
    parameter S3=3'd3;
    parameter S4=3'd4;
    reg [2:0] state;
    reg [3:0] timer;
    always@(posedge clk or posedge reset)
    begin
    if(reset) begin
    state<=S0;
    timer<=0;
    end
    else begin
    case(state)
    S0:begin //NS go EW stop
    if(timer==9)
    begin
    state<=S1;
    timer<=0;
    end
    else
    timer<=timer+1;
    end
    
    S1: begin //NS get ready to stop
    if(timer==3)begin
    timer<=0;
    state<=S2;
    end
    else
    timer<=timer+1;
    end
    
    S2: begin //NS stop and EW go
    if(timer==9)begin
    timer<=0;
    state<=S3;
    end
    else
    timer<=timer+1;
    end
    
    S3: begin //EW get ready to stop
    if(timer==3)begin
    if(ped==1)begin
    state<=S4;
    timer<=0;
    end
    else begin
    timer<=0;
    state<=S0;
    end
    end
    else
    timer<=timer+1;
    end
    
    S4:begin //pedestrian can walk/cross the road 
    if(timer==7)begin
    timer<=0;
    state<=S0;
    end
    else
    timer<=timer+1;
    end
    
    default:begin
    timer<=0;
    state<=S0;
    end
    endcase
    end
    end
    
    always @(*)begin
    NS_G=0;
    NS_Y=0;
    NS_R=0;
    
    EW_G=0;
    EW_Y=0;
    EW_R=0;
    
    PD_G=0;
    PD_R=1;
    
    case(state)
    S0:begin
    NS_G=1;
    EW_R=1;
    end
    
    S1:begin
    NS_Y=1;
    EW_R=1;
    end
    
    S2:begin
    NS_R=1;
    EW_G=1;
    end
    
    S3:begin
    NS_R=1;
    EW_Y=1;
    end
    
    S4:begin
    NS_R=1;
    EW_R=1;
    PD_G=1;
    PD_R=0;
    end
    
    default:
    begin
    NS_R=1;
    EW_R=1;
    PD_R=1;
    end
    endcase
    end
endmodule
