// RCA Testbench

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "package.sv"

module tb_top;
  
    adder_if vif();
  
  ripple_carry_adder_8bit dut (.A(vif.A), .B(vif.B), .Cin(vif.Cin), .S(vif.S), .Cout(vif.Cout));
    
    initial begin
        uvm_config_db#(virtual adder_if)::set(null, "*", "vif", vif);
        run_test("adder_test");
    end
  
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
  end
  
endmodule
