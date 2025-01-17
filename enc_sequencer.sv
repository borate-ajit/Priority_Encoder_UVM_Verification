// Sequencer class to manage and schedule the sending of transactions
class enc_sequencer extends uvm_sequencer #(enc_transaction);
  
  `uvm_component_utils(enc_sequencer)
  
  // Constructor for the sequencer class
  function new(string name = "enc_sequencer", uvm_component parent);
    super.new(name, parent);
  endfunction

endclass