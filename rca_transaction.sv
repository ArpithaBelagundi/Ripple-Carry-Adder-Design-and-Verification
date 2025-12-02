//RCA Transaction
class adder_transaction extends uvm_sequence_item;
  
  `uvm_object_utils_begin(adder_transaction) //FACTORY REGISTRATION
  `uvm_field_int(A,UVM_ALL_ON)
  `uvm_field_int(B,UVM_ALL_ON)
  `uvm_field_int(Cin,UVM_ALL_ON)
  `uvm_field_int(S,UVM_ALL_ON)
  `uvm_field_int(Cout,UVM_ALL_ON)
  `uvm_object_utils_end
  
    rand bit [7:0] A, B;
    rand bit Cin;
    bit [7:0] S;
    bit Cout;
  
    function new(string name = "adder_transaction");
        super.new(name);
    endfunction
  
endclass
