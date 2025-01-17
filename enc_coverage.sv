// Class to collect coverage information for encoding transactions
class enc_coverage extends uvm_subscriber#(enc_transaction);

  // UVM macro to register the class as a UVM component
  `uvm_component_utils(enc_coverage)

  enc_transaction tr;  // Declare a transaction object to hold the data for coverage analysis

  // Define a covergroup to capture coverage for specific fields of the transaction
  covergroup cg;
    option.per_instance = 1;  // Ensure that the covergroup is evaluated per instance
    
    // Coverpoint for the 'D' field of the transaction (8 bits of data)
    coverpoint tr.D {
      // Bins define the ranges of values for 'D' (8-bit value)
      bins low_priority = {[8'd1 : 8'd50]};     // Low priority range (1-50)
      bins mid_priority = {[8'd51 : 8'd150]};   // Mid priority range (51-150)
      bins high_priority = {[8'd151 : 8'd255]}; // High priority range (151-255)
    }

    // Coverpoint for the 'y' field of the transaction (3 bits of output)
    coverpoint tr.y {
      bins all_y[] = {[3'b000 : 3'b111]};  // All possible 3-bit values for 'y' (0-7)
    }

    // Uncomment to define cross-coverage between D and y
    // cross tr.D, tr.y;
  endgroup

  // Constructor to initialize the coverage object
  function new(string name = "enc_coverage", uvm_component parent);
    super.new(name, parent);  // Call the base class constructor
    cg = new();  // Create the covergroup object
  endfunction

  // Function to sample coverage data from the transaction
  function void write(enc_transaction t);
    this.tr = t;   // Assign the transaction object to the local variable
    cg.sample();   // Sample the covergroup to capture coverage data for the transaction
  endfunction

endclass
