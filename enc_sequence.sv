// Sequence class for generating random transactions to send to the DUT
class enc_sequence extends uvm_sequence #(enc_transaction);
  
  `uvm_object_utils(enc_sequence)
  
  enc_transaction tr;  // Instance of the transaction class
  
  // Constructor for the sequence class
  function new(string name = "enc_sequence");
    super.new(name);
  endfunction


  // Body of the sequence to generate and randomize transactions
  virtual task body();
    tr = enc_transaction::type_id::create("tr");  // Create an instance of the transaction
    repeat(1000) begin   // Repeat for 1000 iterations
      start_item(tr);    // Start a new item (transaction)
      assert(tr.randomize);  // Randomize the transaction data
      finish_item(tr);   // Mark the item as finished
      `uvm_info("[SEQ]",$sformatf("\tD = %0b",tr.D), UVM_LOW);  // Log the data D
    end
  endtask
endclass
