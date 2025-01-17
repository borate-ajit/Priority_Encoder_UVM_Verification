// Driver class to send transactions to the DUT (Device Under Test)
class enc_driver extends uvm_driver #(enc_transaction);
  
  `uvm_component_utils(enc_driver)
  
  enc_transaction tr;   // Instance of the transaction
  virtual enc_if vif;   // Virtual interface for communication with DUT
  semaphore sem;        // Semaphore for synchronization
  
  // Constructor for the driver class
  function new(string name = "enc_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Function to set the semaphore for synchronization
  function void set_semaphore(semaphore s);
    sem = s;
  endfunction
  
  // Build phase for the driver where the virtual interface is configured
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
    // Get the virtual interface from the configuration database
    if(!uvm_config_db#(virtual enc_if)::get(this,"","vif",vif))
      `uvm_info("[DRV]","Configuration failed", UVM_MEDIUM); // Log failure if config is not found
  endfunction
  
  // Run phase to continuously get transactions and send them to the DUT
  task run_phase(uvm_phase phase);
    tr = enc_transaction::type_id::create("tr");  // Create a new transaction
    forever begin
      sem.get(1);  // Acquire the semaphore to synchronize
      seq_item_port.get_next_item(tr);  // Get the next item (transaction) from the sequencer
      vif.D <= tr.D;  // Send the input data to the DUT
      seq_item_port.item_done();  // Mark the item as completed
      `uvm_info("[DRV]",$sformatf("\tD = %0b",tr.D), UVM_LOW);  // Log the data D sent to DUT
      sem.put(1);  // Release the semaphore
    end
  endtask
    
endclass