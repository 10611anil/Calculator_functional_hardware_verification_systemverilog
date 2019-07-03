`include "/nfs/home/a/a_band/Questa/generator.sv"

class driver;
int no_iterations;
virtual intf inf1;
mailbox #(transaction) gen2driv, driv2scb;
transaction tr;
// custom constructor
function new(mailbox #(transaction) gen2driv, driv2scb, virtual intf inf1);
this.gen2driv = gen2driv;
this.inf1 = inf1;
this.driv2scb = driv2scb;
endfunction

//input declerations for all input ports


/*$display("@ %0t [DRIVER] write to port1 \n",$time);
@(posedge inf1.cb);
inf1.cb.req1_data_in <= tr.req1_data_ina;
inf1.cb.req1_cmd_in <= tr.req1_cmd_in;
@(posedge inf1.cb);
inf1.cb.req1_cmd_in <= 0;
inf1.cb.req1_data_in <= tr.req1_data_inb;
@(posedge inf1.cb);
tr.out_data1 = inf1.cb.out_data1;
tr.out_resp1 = inf1.cb.out_resp1;
endtask*/

task input1();
$display("@ %0t [DRIVER] write to port1 \n",$time);
@(posedge inf1.cb);
inf1.cb.req1_data_in <= tr.req1_data_ina;
inf1.cb.req1_cmd_in <= tr.req1_cmd_in;
@(negedge inf1.cb);
inf1.cb.req1_cmd_in <= 0;
inf1.cb.req1_data_in <= tr.req1_data_inb;
@(posedge inf1.cb);
tr.out_data1=inf1.cb.out_data1;
endtask

task input2();
$display("@ %0t [DRIVER] write to port2 \n",$time);
@(posedge inf1.cb);
inf1.cb.req2_data_in <= tr.req2_data_ina;
inf1.cb.req2_cmd_in <= tr.req2_cmd_in;
@(negedge inf1.cb);
inf1.cb.req2_cmd_in <= 0;
inf1.cb.req2_data_in <= tr.req2_data_inb;
@(posedge inf1.cb);
tr.out_data2 = inf1.cb.out_data2;
tr.out_resp2 = inf1.cb.out_resp2;
endtask

task input3();
$display("@ %0t [DRIVER] write to port3 \n",$time);
@(posedge inf1.cb)
inf1.cb.req3_data_in <= tr.req3_data_ina;
inf1.cb.req3_cmd_in <= tr.req3_cmd_in;
@(negedge inf1.cb)
inf1.cb.req3_data_in <= tr.req3_data_inb;
inf1.cb.req3_cmd_in <= 0;
@(posedge inf1.cb);
tr.out_data3 = inf1.cb.out_data3;
tr.out_resp3 = inf1.cb.out_resp3;
endtask

task input4();
$display("@ %0t [DRIVER] write to port4 \n",$time);
@(posedge inf1.cb)
inf1.cb.req4_data_in <= tr.req4_data_ina;
inf1.cb.req4_cmd_in <= tr.req4_cmd_in;
@(negedge inf1.cb)
inf1.cb.req4_data_in <= tr.req4_data_inb;
inf1.cb.req4_cmd_in <= 0;
@(posedge inf1.cb);
tr.out_data4 = inf1.cb.out_data4;
tr.out_resp4 = inf1.cb.out_resp4;
endtask

task reset();
$display("reset is turned on");
  repeat(7)
  begin
    @(posedge inf1.cb)
inf1.cb.reset <= 7'b1111111;
inf1.cb.req1_data_in <= 0;
inf1.cb.req2_data_in <= 0;
inf1.cb.req3_data_in <= 0;
inf1.cb.req4_data_in <= 0;
inf1.cb.req1_cmd_in <= 0;
inf1.cb.req2_cmd_in <= 0;
inf1.cb.req3_cmd_in <= 0;
inf1.cb.req4_cmd_in <= 0;
end
inf1.cb.reset <= 0;
$display("reset is turned off");
endtask

//running all tasks concurrently
task run();
$display("run method is started");
forever 
begin
  //transaction tr;
gen2driv.get(tr);
fork
input1();
input2();
input3();
input4();
join
no_iterations++;
driv2scb.put(tr);
$display("No of Iterations: %p",no_iterations);
tr.display();
end
$display("@%t: run method ended", $time);
endtask

endclass
