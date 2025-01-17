// Agent class that coordinates the sequencer, driver, and monitor
class enc_agent extends uvm_agent;
  
  `uvm_component_utils(enc_agent)
  
  enc_sequencer seqr;  // Sequencer to send transactions
  enc_driver drv;      // Driver to pass transactions to DUT
  enc_monitor mon;     // Monitor to observe DUT outputs
  semaphore_shared shared;  // Shared semaphore for synchronization
  
  // Constructor for the agent class
  function new(string name = "enc_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase where the components are instantiated and connected
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    shared = new();  // Create a new semaphore instance
    
    mon = enc_monitor::type_id::create("mon",this);  // Create the monitor
    seqr = enc_sequencer::type_id::create("seqr", this);  // Create the sequencer
    drv = enc_driver::type_id::create("drv", this);  // Create the driver
    
    drv.set_semaphore(shared.sem);  // Pass semaphore to driver
    mon.set_semaphore(shared.sem);  // Pass semaphore to monitor
  endfunction
  
  // Connect phase where the sequencer and driver are connected
  function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(seqr.seq_item_export);  // Connect sequencer to driver
  endfunction
endclass