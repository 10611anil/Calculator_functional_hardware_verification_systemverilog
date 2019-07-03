`include "/nfs/home/a/a_band/Questa/monitor.sv"

class scoreboard;
mailbox #(transaction) mon2scb, driv2scb;
int count;
transaction driv_tr,mon_tr;

reg [0:31] exp_data1,exp_data2,exp_data3,exp_data4;
reg [0:3] exp_res1,exp_res2,exp_res3,exp_res4;

function new(mailbox #(transaction) mon2scb,driv2scb);
this.driv2scb = driv2scb;
this.mon2scb = mon2scb;
endfunction

task scb_in1();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port1",
                   $time);
begin
case(driv_tr.req1_cmd_in)
4'd1 : begin
         exp_data1 = driv_tr.req1_data_ina + driv_tr.req1_data_inb;
         exp_res1 = 1'b1;
        end
4'd2 : begin
         exp_data1 = driv_tr.req1_data_ina - driv_tr.req1_data_inb;
         exp_res1 = 1'b1;
        end
4'd5 : begin
         exp_data1 = driv_tr.req1_data_ina << driv_tr.req1_data_inb[0:4];
         exp_res1 = 1'b1;
        end
4'd6 : begin
         exp_data1 = driv_tr.req1_data_ina >> driv_tr.req1_data_inb[0:4];
         exp_res1 = 1'b1;
        end
endcase
 $display("@%0d: calculated expected data1 = %d and expected response1 = %d - f0r port1",
                   $time,exp_data1,exp_res1);
end
endtask

task scb_in2();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port2",
                   $time);
begin
case(driv_tr.req2_cmd_in)
4'd1 : begin
         exp_data2 = driv_tr.req2_data_ina + driv_tr.req2_data_inb;
         exp_res2 = 1'b1;
        end
4'd2 : begin
         exp_data2 = driv_tr.req2_data_ina - driv_tr.req2_data_inb;
         exp_res2 = 1'b1;
        end
4'd5 : begin
         exp_data2 = driv_tr.req2_data_ina << driv_tr.req2_data_inb[0:4];
         exp_res2 = 1'b1;
        end
4'd6 : begin
         exp_data2 = driv_tr.req2_data_ina >> driv_tr.req2_data_inb[0:4];
         exp_res2 = 1'b1;
        end
endcase
 $display("@%0d: calculated expected data2 = %d and expected response2 = %d - f0r port2",
                   $time,exp_data2,exp_res2);
end
endtask

task scb_in3();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port3",
                   $time);
begin
case(driv_tr.req3_cmd_in)
4'd1 : begin
         exp_data3 = driv_tr.req3_data_ina + driv_tr.req3_data_inb;
         exp_res3=1'b1;
        end
4'd2 : begin
         exp_data3 = driv_tr.req3_data_ina - driv_tr.req3_data_inb;
         exp_res3 = 1'b1;
        end
4'd5 : begin
         exp_data3 = driv_tr.req3_data_ina << driv_tr.req3_data_inb[0:4];
         exp_res3 = 1'b1;
        end
4'd6 : begin
         exp_data3 = driv_tr.req3_data_ina >> driv_tr.req3_data_inb[0:4];
         exp_res3 = 1'b1;
        end
endcase
 $display("@%0d: calculated expected data3 = %d and expected response3 = %d - f0r port3",
                   $time,exp_data3,exp_res3);
end
endtask


task scb_in4();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port4",
                   $time);

begin
case(driv_tr.req4_cmd_in)
4'd1 : begin
         exp_data4 = driv_tr.req4_data_ina + driv_tr.req4_data_inb;
         exp_res4=1'b1;
        end
4'd2 : begin
         exp_data4 = driv_tr.req4_data_ina - driv_tr.req4_data_inb;
         exp_res4 = 1'b1;
        end
4'd5 : begin
         exp_data4 = driv_tr.req4_data_ina << driv_tr.req4_data_inb[0:4];
         exp_res4 = 1'b1;
        end
4'd6 : begin
         exp_data4 = driv_tr.req4_data_ina >> driv_tr.req4_data_inb[0:4];
         exp_res4 = 1'b1;
        end
endcase
 $display("@%0d: calculated expected data4 = %d and expected response4 = %d - f0r port4",
                   $time,exp_data4,exp_res4);
end
endtask


task main();


    $display($time, ": Starting scoreboard for %0d transaction", count);

forever
begin
driv2scb.get(driv_tr);
mon2scb.get(mon_tr);

fork
scb_in1();
scb_in2();
scb_in3();
scb_in4();
/*
scb_in (exp_out1,exp_res1,driv_tr.req1_data_ina,driv_tr.req1_data_inb,driv_tr.req1_cmd_in);
scb_in (exp_out2,exp_res2,driv_tr.req2_data_ina,driv_tr.req2_data_inb,driv_tr.req2_cmd_in);
scb_in (exp_out3,exp_res3,driv_tr.req3_data_ina,driv_tr.req3_data_inb,driv_tr.req3_cmd_in);
scb_in (exp_out4,exp_res4,driv_tr.req4_data_ina,driv_tr.req4_data_inb,driv_tr.req4_cmd_in);*/
join

fork
sub_check1();
sub_check2();
sub_check3();
sub_check4();
join
count++;
$display("scoreboard method completed");
end
endtask


task sub_check1();
  begin
if(driv_tr.req1_cmd_in != mon_tr.req1_cmd_in)
 $display("@%0d: ERROR driver command type (%d) does not match with monitor (%d)",
                   $time, driv_tr.req1_cmd_in, mon_tr.req1_cmd_in);

else if ((driv_tr.req1_data_ina != mon_tr.req1_data_ina) || (driv_tr.req1_data_inb != mon_tr.req1_data_inb))
                $display("@%0d: ERROR master transaction data1_ina(%h) does not match monitor_data1_ina (%h), master transaction data1_inb(%h) does not match monitor_data1_inb (%h)",
                         $time, driv_tr.req1_data_ina,mon_tr.req1_data_ina,driv_tr.req1_data_inb,mon_tr.req1_data_inb);
if (driv_tr.out_data1 != mon_tr.out_data1)
$display("@%0d: Data match driver_out_data1=%H monitor_Data1=%H ", $time,  driv_tr.out_data1,  mon_tr.out_data1);
else if((exp_data1 == mon_tr.out_data1) && (exp_res1 == mon_tr.out_resp1))
       $display("@%0d: Data match expected_data1=%H monitor_Data1=%H and expected_res1 = %d monitor_res1 = %d", $time, exp_data1, mon_tr.out_data1, exp_res1, mon_tr.out_resp1);

else
 $display("@%0d: Data didn't match expected_data1=%H monitor_Data1=%H", $time, exp_data1, mon_tr.out_data1);
 end
endtask

task sub_check2();
  begin
if(driv_tr.req2_cmd_in != mon_tr.req2_cmd_in)
 $display("@%0d: ERROR driver command type (%d) does not match with monitor (%d)",
                   $time, driv_tr.req2_cmd_in, mon_tr.req2_cmd_in);

else if ((driv_tr.req2_data_ina != mon_tr.req2_data_ina) || (driv_tr.req2_data_inb != mon_tr.req2_data_inb))
                $display("@%0d: ERROR master transaction data2_ina(%h) does not match monitor_data2_ina (%h), master transaction data2_inb(%h) does not match monitor_data2_inb (%h)",
                         $time, driv_tr.req2_data_ina,mon_tr.req2_data_ina,driv_tr.req2_data_inb,mon_tr.req2_data_inb);
if (driv_tr.out_data2 != mon_tr.out_data2)
$display("@%0d: Data match driver_out_data2=%H monitor_Data2=%H ", $time,  driv_tr.out_data2,  mon_tr.out_data2);
else if((exp_data2 == mon_tr.out_data2) && (exp_res2 == mon_tr.out_resp2))
       $display("@%0d: Data match expected_data2=%H monitor_Data2=%H and expected_res2 = %d monitor_res2 = %d", $time, exp_data2, mon_tr.out_data2, exp_res2, mon_tr.out_resp2);

else
 $display("@%0d: Data didn't match expected_data2=%H monitor_Data2=%H", $time, exp_data2, mon_tr.out_data2);
 end
endtask

task sub_check3();
  begin
if(driv_tr.req3_cmd_in != mon_tr.req3_cmd_in)
 $display("@%0d: ERROR driver command type (%d) does not match with monitor (%d)",
                   $time, driv_tr.req3_cmd_in, mon_tr.req3_cmd_in);

else if ((driv_tr.req3_data_ina != mon_tr.req3_data_ina) || (driv_tr.req3_data_inb != mon_tr.req3_data_inb))
                $display("@%0d: ERROR master transaction data3_ina(%h) does not match monitor_data3_ina (%h), master transaction data3_inb(%h) does not match monitor_data3_inb (%h)",
                         $time, driv_tr.req3_data_ina,mon_tr.req3_data_ina,driv_tr.req3_data_inb,mon_tr.req3_data_inb);
if (driv_tr.out_data3 != mon_tr.out_data3)
$display("@%0d: Data match driver_out_data3=%H monitor_Data3=%H ", $time,  driv_tr.out_data3,  mon_tr.out_data3);
 else if((exp_data3 == mon_tr.out_data3) && (exp_res3 == mon_tr.out_resp3))
       $display("@%0d: Data match expected_data3=%H monitor_Data3=%H and expected_res3 = %d monitor_res3 = %d", $time, exp_data3, mon_tr.out_data3, exp_res3, mon_tr.out_resp3);

else
$display("@%0d: Data didn't match expected_data3=%H monitor_Data3=%H", $time, exp_data3, mon_tr.out_data3);
end
endtask

task sub_check4();
  begin
if(driv_tr.req4_cmd_in != mon_tr.req4_cmd_in)
 $display("@%0d: ERROR driver command type (%d) does not match with monitor (%d)",
                   $time, driv_tr.req4_cmd_in, mon_tr.req4_cmd_in);

else if ((driv_tr.req4_data_ina != mon_tr.req4_data_ina) || (driv_tr.req4_data_inb != mon_tr.req4_data_inb))
                $display("@%0d: ERROR master transaction data4_ina(%h) does not match monitor_data4_ina (%h), master transaction data4_inb(%h) does not match monitor_data4_inb (%h)",
                         $time, driv_tr.req4_data_ina,mon_tr.req4_data_ina,driv_tr.req4_data_inb,mon_tr.req4_data_inb);
if (driv_tr.out_data4 != mon_tr.out_data4)
$display("@%0d: Data match driver_out_data4=%H monitor_Data4=%H ", $time,  driv_tr.out_data4,  mon_tr.out_data4);
else if((exp_data4 == mon_tr.out_data4) && (exp_res4 == mon_tr.out_resp4))
       $display("@%0d: Data match expected_data4=%H monitor_Data4=%H and expected_res4 = %d monitor_res4 = %d", $time, exp_data4, mon_tr.out_data4, exp_res4, mon_tr.out_resp4);

else
 $display("@%0d: Data didn't match expected_data4=%H monitor_Data4=%H", $time, exp_data4, mon_tr.out_data4);
end
endtask

endclass




















/*function scb_in(logic [0:3] req_cmd_in,logic [0:31] out_data,logic [0:31] input1,logic [0:31] input2);
//output [0:31] exp_data;
//output exp_res;
logic [0:31] exp_data;
logic [0:3] exp_res;

//input [0:31] req_data_ina, req_data_inb;
//input [0:3] req_cmd_in;
forever
      begin
case(req_cmd_in)
4'd1 : 
begin
  exp_data = input1 + input2;
  exp_res = 1'b1;
	if(exp_data==out_data);
		$display("Match");
		count++;
end
4'd2 : 
begin
  exp_data = input1 - input2;
  exp_res = 1'b1;
	if(exp_data==out_data);
		$display("Match");
		count++;
end
4'd5 : 
begin
    exp_data = input1 << input2[0:4];
    exp_res = 1'b1;
	  if(exp_data==out_data);
		  $display("Match");
		  count++;
end
4'd6 : 
begin
         exp_data = input1 >> input2[0:4];
         if(exp_data==out_data);
		$display("Match");
		count++;
end
endcase
end
endfunction

task main();
$display("[scoreboard] Main Task:");
driv2scb.get(driv_tr);
mon2soc.get(mon_tr);
fork
scb_in(driv_tr.req1_cmd_in,driv_tr.out_data1,driv_tr.req1_data_ina,driv_tr.req1_data_inb);
scb_in(driv_tr.req2_cmd_in,driv_tr.out_data2,driv_tr.req2_data_ina,driv_tr.req2_data_inb);
scb_in(driv_tr.req3_cmd_in,driv_tr.out_data3,driv_tr.req3_data_ina,driv_tr.req3_data_inb);
scb_in(driv_tr.req4_cmd_in,driv_tr.out_data4,driv_tr.req4_data_ina,driv_tr.req4_data_inb);
join
$display("[scoreboard] count: %p",count);
endtask*/


