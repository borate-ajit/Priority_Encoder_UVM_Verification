// Test class to initiate and control the simulation
class enc_test extends uvm_test;
  
  `uvm_component_utils(enc_test)
  
  enc_environment env;  // Instance of the environment
  enc_sequence seq;    // Instance of the sequence
  
  // Constructor for the test class
  function new(string name = "enc_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase where the environment and sequence are instantiated
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    env = enc_environment::type_id::create("env",this);  // Create the environment
    seq = enc_sequence::type_id::create("seq");  // Create the sequence
  endfunction
  
  // Run phase to start the sequence and finish the test
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);  // Raise an objection to prevent the test from ending prematurely
    seq.start(env.agt.seqr);  // Start the sequence on the sequencer
    #40;  // Wait for some time (simulate a delay)
    phase.drop_objection(this);  // Drop the objection to allow the test to complete
  endtask
  
  // End-of-elaboration phase where topology is printed
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology;  // Print the simulation topology
  endfunction
  
  // Report phase to output coverage information
  function void report_phase(uvm_phase phase);
    $display("functional coverage: %0.2f", env.cov.cg.get_coverage());  // Display functional coverage
  endfunction
endclass