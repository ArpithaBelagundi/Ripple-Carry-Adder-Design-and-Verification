// UVM Monitor
class adder_monitor extends uvm_monitor;
  `uvm_component_utils(adder_monitor) //FACTORY
  
  virtual adder_if vif;
  adder_transaction trans;
  uvm_analysis_port #(adder_transaction) mon_ap;
  
  function new(string name = "adder_monitor", uvm_component parent=null);
     super.new(name, parent);
   endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_ap = new("mon_ap", this);
        trans = adder_transaction::type_id::create("trans");
        if (!uvm_config_db#(virtual adder_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal("MONITOR", "No virtual interface found!")
        end
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        forever begin
            #10;
            trans.A = vif.A;
            trans.B = vif.B;
            trans.Cin = vif.Cin;
            trans.S = vif.S;
            trans.Cout = vif.Cout;
            mon_ap.write(trans);
        end
    endtask
  
endclass
