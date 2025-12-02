// UVM Driver
class adder_driver extends uvm_driver #(adder_transaction);
  `uvm_component_utils(adder_driver) //FACTORY
  
  virtual adder_if vif;
  
  function new(string name = "adder_driver", uvm_component parent =null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual adder_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("DRIVER", "No virtual interface found!")
        end
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            vif.A <= req.A;
            vif.B <= req.B;
            vif.Cin <= req.Cin;
            #10; // Simulate propagation delay
            seq_item_port.item_done();
        end
    endtask
  
endclass
