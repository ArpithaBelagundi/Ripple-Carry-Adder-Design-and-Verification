// UVM Scoreboard
class adder_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(adder_scoreboard) //FACTORY
  
    uvm_analysis_imp #(adder_transaction, adder_scoreboard) sb_imp;
    
  function new(string name = "adder_scoreboard", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sb_imp = new("sb_imp", this);
    endfunction
    
    virtual function void write(adder_transaction trans);
        bit [8:0] expected = trans.A + trans.B + trans.Cin;
      if (trans.S !== expected[7:0] || trans.Cout !== expected[8]) begin
        `uvm_info("SCOREBOARD", $sformatf("MISMATCH: a=%0d b=%0d cin=%0d | Expected sum=%0d, cout=%0d | Got sum=%0d, cout=%0d",
                                          trans.A, trans.B, trans.Cin, expected[7:0], expected[8], trans.S, trans.Cout),UVM_LOW);
        end else begin
          `uvm_info("SCOREBOARD", $sformatf("MATCH: a=%0d b=%0d cin=%0d | Expected sum=%0d, cout=%0d | Got sum=%0d, cout=%0d",
                                            trans.A, trans.B, trans.Cin, expected[7:0], expected[8], trans.S, trans.Cout),UVM_LOW);
        end
    endfunction
  
endclass
