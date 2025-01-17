// Scoreboard class for comparing the output from the DUT with expected results
class enc_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(enc_scoreboard)
  
  uvm_analysis_imp#(enc_transaction, enc_scoreboard) imp;   // Analysis interface to receive data
  
  // Constructor for the scoreboard class
  function new(string name = "enc_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase where the analysis interface is created
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    imp = new("imp", this);  // Create the analysis interface
  endfunction
  
  // Function to write the received transaction and perform verification
  function void write(enc_transaction tr);
    bit [2:0] y_sb;  // Variable to store the expected priority encoding
    
    // Calculate the expected encoding based on the input data
    if (tr.D[7] == 1) begin
            y_sb = 3'b111;
        end else if (tr.D[6] == 1) begin
            y_sb = 3'b110;
        end else if (tr.D[5] == 1) begin
            y_sb = 3'b101;
        end else if (tr.D[4] == 1) begin
            y_sb = 3'b100;
        end else if (tr.D[3] == 1) begin
            y_sb = 3'b011;
        end else if (tr.D[2] == 1) begin
            y_sb = 3'b010;
        end else if (tr.D[1] == 1) begin
            y_sb = 3'b001;
        end else if (tr.D[0] == 1) begin
            y_sb = 3'b000;
        end else begin
            $display("Invalid data received");
        end
    
    // Compare the expected and actual results
    if (tr.y !== y_sb)
      `uvm_error(get_type_name, $sformatf("Mismatch! D = %0b \ty = %0b  \t(expected y = %0b )", tr.D, tr.y, y_sb))
    else 
      `uvm_info(get_type_name, "Match Result is correct", UVM_MEDIUM)  // Log if the results match
  endfunction
endclass