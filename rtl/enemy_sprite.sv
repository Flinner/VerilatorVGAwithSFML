`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2024 05:37:25 PM
// Design Name: 
// Module Name: drawing_logic
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

module enemy_sprite (
    input logic [8:0] x_red,
    input logic [8:0] y_red,
    input logic [8:0] x_blue,
    input logic [8:0] y_blue,
    input logic [8:0] x_yellow,
    input logic [8:0] y_yellow,
    input logic [8:0] x_pink,
    input logic [8:0] y_pink,
    input logic [7:0] sx,
    input logic [8:0] sy,

    output logic [3:0] R,
    output logic [3:0] G,
    output logic [3:0] B
);

  localparam SPRITE_WIDTH = 8;
  localparam SPRITE_HEIGHT = 8;

  logic pixel_in_red_sprite;
  logic [11:0] R_color;
  assign R_color = 12'hE11;

  logic [3:0] R_red;
  logic [3:0] G_red;
  logic [3:0] B_red;

  always_comb begin
    pixel_in_red_sprite = (({1'b0,sx} >= x_red && {1'b0,sx} < x_red + SPRITE_WIDTH) &&
                       (sy >= y_red && sy < y_red + SPRITE_HEIGHT));

    if (pixel_in_red_sprite) begin
      R_red = R_color[11:8];
      G_red = R_color[7:4];
      B_red = R_color[3:0];
    end else begin
      //square = (sx1 >= x1_pac && sx1<x2_pac) && (sy1 >= y1 && sy1< y2);
      R_red = 4'h0;  // Default red component
      G_red = 4'h0;  // Default green component
      B_red = 4'h0;  // Default blue component
    end
  end


  assign R = R_red;
  assign G = G_red;
  assign B = B_red;


endmodule : enemy_sprite