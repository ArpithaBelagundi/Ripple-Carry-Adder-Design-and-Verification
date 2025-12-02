class adder_env extends uvm_env;
  `uvm_component_utils(adder_env) //FACTORY
  
    adder_agent agt;
    adder_scoreboard sb;
    
  function new(string name = "adder_env", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agt = adder_agent::type_id::create("agt", this);
        sb = adder_scoreboard::type_id::create("sb", this);
    endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.mon_ap.connect(sb.sb_imp);
  endfunction
  
endclass
