// Class definition for the transaction that encapsulates the input and output data
class enc_transaction extends uvm_sequence_item;
  
  rand bit [7:0] D;  // Randomized 8-bit input for the encoder
  bit [2:0] y;       // 3-bit output for the encoder result
  bit [7:0] in = 8'b0000_0001;  // Internal variable to keep track of the shift register
  
  // Constraint ensuring that D is not zero
  constraint valid_input { D != 8'b0;}
  
  // Post-randomize function that shifts the input value 'in' for the next randomization
  function void post_randomize;
      in = in << 1;   // Shift left to simulate a new input pattern
      //$display(in);   // Display the updated input value
    if (in == 8'b0000_0000)
      in = 8'b0000_0001;  // If 'in' reaches zero, reset to initial value
  endfunction

  // Constraint to ensure that the randomized D is greater than or equal to 'in'
  constraint input_con {D >= in;}
  
  // UVM macros for object utilities and field registration
  `uvm_object_utils_begin(enc_transaction)
  `uvm_field_int(D, UVM_ALL_ON)
  `uvm_field_int(y, UVM_ALL_ON)
  `uvm_object_utils_end
  
  // Constructor for the transaction class
  function new(string name = "enc_transaction");
    super.new(name);
  endfunction
endclass
