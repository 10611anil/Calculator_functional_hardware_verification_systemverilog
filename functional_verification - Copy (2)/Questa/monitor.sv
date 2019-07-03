//`include "/nfs/home/a/a_band/Questa/TRANS.sv"
`include "/nfs/home/a/a_band/Desktop/calc1/driver.sv"
class monitor;
virtual intf.monitor_cb intf2;
mailbox #(transaction) mon2scb;
transaction tr;
int no_iterations;

function new(virtual intf.monitor_cb intf2,mailbox #(transaction) mon2scb);
this.intf2 = intf2;
this.mon2scb = mon2scb;
endfunction

task input1();
  begin
@(posedge intf2.cb);
$display("@ %0t [MONITOR] write to port1 \n",$time);
@(posedge intf2.cb);
tr.req1_data_ina = intf2.req1_data_in;
tr.req1_cmd_in = intf2.req1_cmd_in;
@(posedge intf2.cb);
tr.req1_cmd_in = 0;
tr.req1_data_inb = intf2.req1_data_in;
@(posedge intf2.cb);
@(negedge intf2.cb);
tr.out_data1=intf2.out_data1;
tr.out_resp1=intf2.out_resp1;
end
endtask

task input2();
  begin
  @(posedge intf2.cb);
$display("@ %0t [MONITOR] write to port2 \n",$time);
@(posedge intf2.cb);
tr.req2_data_ina = intf2.req2_data_in;
tr.req2_cmd_in = intf2.req2_cmd_in;
@(posedge intf2.cb);
tr.req2_cmd_in = 0;
tr.req2_data_inb = intf2.req2_data_in;
@(posedge intf2.cb);
@(negedge intf2.cb);
tr.out_data2=intf2.out_data2;
tr.out_resp2=intf2.out_resp2;
end
endtask

task input3();
  begin
  @(posedge intf2.cb);
$display("@ %0t [MONITOR] write to port3 \n",$time);
@(posedge intf2.cb);
tr.req3_data_ina = intf2.req3_data_in;
tr.req3_cmd_in = intf2.req3_cmd_in;
@(posedge intf2.cb);
tr.req3_cmd_in = 0;
tr.req3_data_inb = intf2.req3_data_in;
@(posedge intf2.cb);
@(negedge intf2.cb);
tr.out_data3=intf2.out_data3;
tr.out_resp3=intf2.out_resp3;
end
endtask

task input4();
  begin
  @(posedge intf2.cb);
$display("@ %0t [MONITOR] write to port4 \n",$time);
@(posedge intf2.cb);
tr.req4_data_ina = intf2.req4_data_in;
tr.req4_cmd_in = intf2.req4_cmd_in;
@(posedge intf2.cb);
tr.req4_cmd_in = 0;
tr.req4_data_inb = intf2.req4_data_in;
@(posedge intf2.cb);
@(negedge intf2.cb);
tr.out_data4=intf2.out_data4;
tr.out_resp4=intf2.out_resp4;
end
endtask

task mnt_main;
forever 
begin
tr = new();
fork
input1();
input2();
input3();
input4();
join
mon2scb.put(tr);
no_iterations++;
$display("No of Iterations: %p",no_iterations);
tr.display();
end
$display("monitor task completed");
endtask

endclass
