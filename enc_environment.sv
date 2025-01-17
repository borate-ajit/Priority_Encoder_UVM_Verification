// Environment class that houses the agent, scoreboard, and coverage components
class enc_environment extends uvm_env;
  
  `uvm_component_utils(enc_environment)
  
  enc_agent agt;  // Instance of the agent
  enc_scoreboard sco;  // Instance of the scoreboard
  enc_coverage cov;  // Instance of the coverage component
  
  // Constructor for the environment class
  function new(string name = "enc_environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase where components are instantiated
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    agt = enc_agent::type_id::create("agt",this);  // Create the agent
    sco = enc_scoreboard::type_id::create("sco",this);  // Create the scoreboard
    cov = enc_coverage::type_id::create("cov", this);  // Create the coverage component
  endfunction
  
  // Connect phase where components are connected to each other
  function void connect_phase(uvm_phase phase);
    agt.mon.ap.connect(sco.imp);  // Connect monitor to scoreboard
    agt.mon.ap.connect(cov.analysis_export);  // Connect monitor to coverage
  endfunction
endclass
