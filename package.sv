// Package containing all necessary imports and includes
package pkg;

	`include "uvm_macros.svh"
	import uvm_pkg::*;
	
	// Include all necessary files for components
	`include "enc_transaction.sv"
	`include "enc_sequencer.sv"
	`include "semaphore.sv"
	`include "enc_driver.sv"
	`include "enc_monitor.sv"
	`include "enc_agent.sv"	
	`include "enc_sequence.sv"
	`include "enc_scoreboard.sv"
	`include "enc_coverage.sv"
	`include "enc_environment.sv"
	`include "enc_test.sv"

endpackage