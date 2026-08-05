`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2026 08:27:42 AM
// Design Name: 
// Module Name: Testbench
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


module Testbench;
reg clk;
reg reset;
reg ped;

wire NS_G;
wire NS_Y;
wire NS_R;

wire EW_G;
wire EW_Y;
wire EW_R;

wire PD_G;
wire PD_R;

Traffic_light uut(
.clk(clk),
.reset(reset),
.ped(ped),

.NS_G(NS_G),
.NS_Y(NS_Y),
.NS_R(NS_R),

.EW_G(EW_G),
.EW_Y(EW_Y),
.EW_R(EW_R),

.PD_G(PD_G),
.PD_R(PD_R));

always #5 clk=~clk;

initial
begin

clk=0;
reset=1;
ped=0;

#20;
reset=0;

#280; //wait for one cycle from S0 to S0 to complete
ped=1;



#360;
$finish;
end
endmodule
