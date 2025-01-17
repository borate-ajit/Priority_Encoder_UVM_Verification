// Interface definition for communication between UVM components and the DUT (Device Under Test)
interface enc_if();
  
  logic [7:0] D;  // 8-bit input for the data to be encoded
  logic [2:0] y;  // 3-bit output for the priority-encoded result
  
endinterface

