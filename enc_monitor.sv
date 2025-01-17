// Monitor class to observe the output from the DUT and write the data to the analysis port
class enc_monitor extends uvm_monitor;
  
  `uvm_component_utils(enc_monitor)
  
  uvm_analysis_port#(enc_transaction) ap;   // Analysis port to send monitored data
  enc_transaction tr;   // Instance of the transaction to store observed data
  virtual enc_if vif;    // Virtual interface for communication with DUT
  semaphore sem;         // Semaphore for synchronization
  
  // Constructor for the monitor class
  function new(string name = "enc_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Function to set the semaphore for synchronization
  function void set_semaphore(semaphore s);
    sem = s;
  endfunction
  
  // Build phase where the analysis port is created and the virtual interface is configured
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    tr = enc_transaction::type_id::create("tr");  // Create a new transaction
    ap = new("ap",this);  // Create an analysis port
    
    // Get the virtual interface from the configuration database
    if(!uvm_config_db#(virtual enc_if)::get(this,"","vif",vif))
      `uvm_info("[MON]","Configuration failed",UVM_MEDIUM); // Log failure if config is not found
  endfunction
      
  // Run phase to observe the DUT output and send it to the scoreboard
  task run_phase(uvm_phase phase);
    forever begin
      sem.get(1);  // Acquire the semaphore to synchronize
      #1;
      tr.D = vif.D;  // Capture the input data from DUT
      tr.y = vif.y;  // Capture the encoded output from DUT
      `uvm_info("[MON]",$sformatf("\tD = %0b, \tY = %0b",tr.D, tr.y), UVM_LOW);  // Log the captured data
      ap.write(tr);  // Send the transaction data to the analysis port
      sem.put(1);  // Release the semaphore
    end
  endtask
endclass