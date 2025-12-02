// UVM Agent
class adder_agent extends uvm_agent;
 `uvm_component_utils(adder_agent) //FACTORY
  
    adder_driver drv;
    adder_monitor mon;
    uvm_sequencer #(adder_transaction) seqr;
  
    
  function new(string name = "adder_agent", uvm_component parent=null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = adder_driver::type_id::create("drv", this);
        mon = adder_monitor::type_id::create("mon", this);
        seqr = uvm_sequencer#(adder_transaction)::type_id::create("seqr", this);
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
  
endclass
