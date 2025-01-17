`include "interface.sv"          // Including the interface definition file
`include "uvm_macros.svh"        // Including UVM macros for the testbench
`include "package.sv"            // Including the package file with necessary components

module tb;

  import uvm_pkg::*;             // Importing the UVM package for testbench functionality
  import pkg::*;                 // Importing the custom package containing all necessary classes
  
  semaphore key;                 // Declare a semaphore object to synchronize components
  enc_if intf();                 // Declare the interface object to connect DUT and testbench
  
  // Instantiate the DUT (Device Under Test), priority_encoder in this case
  priority_encoder DUT(
    .D(intf.D),                   // Connect D input of DUT to D in interface
    .y(intf.y)                    // Connect y output of DUT to y in interface
  );
  
  initial begin 
    run_test("enc_test");         // Start the UVM test named 'enc_test'
  end
  
  initial begin
    key = new(1);                 // Initialize the semaphore with a size of 1 (binary semaphore)
    uvm_config_db#(virtual enc_if)::set(null,"*","vif",intf);  // Set the configuration database to link the virtual interface 'vif' with the interface 'intf'
  end
  
endmodule 
