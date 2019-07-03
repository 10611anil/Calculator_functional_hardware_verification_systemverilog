`include "/nfs/home/a/a_band/Questa/TRANS.sv"

class generator;
rand transaction trans;
mailbox #(transaction) gen2driv;
int iteration;
event exit;
function new(mailbox #(transaction) gen2driv);
this.gen2driv = gen2driv;
endfunction

//main task togenerate transaction
task major();
repeat(iteration)
begin
trans = new();
if (!trans.randomize())
$display("randomization failed");
trans.display();
gen2driv.put(trans);
end
->exit;
endtask
endclass
