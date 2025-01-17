// Priority Encoder Module
module priority_encoder(
  input  logic [7:0] D, // 8-bit input data (D)
  output logic [2:0] y  // 3-bit output representing priority
);
  
  // Priority encoding logic using case statement
  always@(D) begin
    casex(D)
      8'b1xxx_xxxx: y = 3'b111; // If MSB (D[7]) is 1, set output to 7 (binary 111)
      8'b01xx_xxxx: y = 3'b110; // If D[6] is 1, set output to 6 (binary 110)
      8'b001x_xxxx: y = 3'b101; // If D[5] is 1, set output to 5 (binary 101)
      8'b0001_xxxx: y = 3'b100; // If D[4] is 1, set output to 4 (binary 100)
      8'b0000_1xxx: y = 3'b011; // If D[3] is 1, set output to 3 (binary 011)
      8'b0000_01xx: y = 3'b010; // If D[2] is 1, set output to 2 (binary 010)
      8'b0000_001x: y = 3'b001; // If D[1] is 1, set output to 1 (binary 001)
      8'b0000_0001: y = 3'b000; // If LSB (D[0]) is 1, set output to 0 (binary 000)
      default: $display("Invalid data received"); // In case of an invalid input
    endcase
  end
endmodule