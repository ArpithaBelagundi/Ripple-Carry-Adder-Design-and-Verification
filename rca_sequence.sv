// UVM Sequence
class adder_sequence extends uvm_sequence #(adder_transaction);
  `uvm_object_utils(adder_sequence) //FACTORY
  
    function new(string name = "adder_sequence");
        super.new(name);
    endfunction
    
    virtual task body();
      adder_transaction trans;
      repeat (5) begin
            trans = adder_transaction::type_id::create("trans");
            start_item(trans);
              assert (trans.randomize());
            finish_item(trans);
      end
    endtask
endclass
