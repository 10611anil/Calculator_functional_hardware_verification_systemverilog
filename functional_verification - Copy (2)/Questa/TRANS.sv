
class transaction;
rand logic [0:31] req1_data_ina;
rand logic [0:31] req2_data_ina;
rand logic [0:31] req3_data_ina;
rand logic [0:31] req4_data_ina;
rand logic [0:31] req1_data_inb;
rand logic [0:31] req2_data_inb;
rand logic [0:31] req3_data_inb;
rand logic [0:31] req4_data_inb;
rand logic [0:3] req1_cmd_in;
rand logic [0:3] req2_cmd_in;
rand logic [0:3] req3_cmd_in;
rand logic [0:3] req4_cmd_in;
rand logic scan_in;
rand logic a_clk, b_clk, c_clk;
rand logic error_found;

logic [0:31] out_data1;
logic [0:31] out_data2;
logic [0:31] out_data3;
logic [0:31] out_data4;
logic [0:1] out_resp1;
logic [0:1] out_resp2;
logic [0:1] out_resp3;
logic [0:1] out_resp4;
  




constraint C1 {
req1_cmd_in inside {1,2,5,6};}
constraint C2 {
req2_cmd_in inside {1,2,5,6};}
constraint C3 {
req3_cmd_in inside {1,2,5,6};}
constraint C4 {
req4_cmd_in inside {1,2,5,6};}
constraint C5 {
req1_data_ina inside {[1:100]};
req1_data_inb inside {[1:100]};}

constraint C6 {
  req2_data_ina inside {[1:100]};
req2_data_inb inside {[1:100]};}

constraint C7 {
  req3_data_ina inside {[1:100]};
req3_data_inb inside {[1:100]};}

constraint C8 {
  req4_data_ina inside {[1:100]};
req4_data_inb inside {[1:100]}; }

// function decleration

function void display();
  $display("data1a:%d,data1b:%d,cmd1:%d,out_data1:%d,out_resp1:%d",req1_data_ina,req1_data_inb,req1_cmd_in,out_data1,out_resp1);
  $display("data2a:%d,data2b:%d,cmd2:%d,out_data2:%d,out_resp2:%d",req2_data_ina,req2_data_inb,req2_cmd_in,out_data2,out_resp2);
  $display("data3a:%d,data3b:%d,cmd3:%d,out_data3:%d,out_resp3:%d",req3_data_ina,req3_data_inb,req3_cmd_in,out_data3,out_resp3);
  $display("data4a:%d,data4b:%d,cmd4:%d,out_data4:%d,out_resp4:%d",req4_data_ina,req4_data_inb,req4_cmd_in,out_data4,out_resp4);
endfunction

function transaction copy();
  copy = new();
  copy.req1_data_ina = req1_data_ina;
  copy.req2_data_ina = req2_data_ina;
  copy.req3_data_ina = req3_data_ina;
  copy.req4_data_ina = req4_data_ina;
  copy.req1_data_inb = req1_data_inb;
  copy.req2_data_inb = req2_data_inb;
  copy.req3_data_inb = req3_data_inb;
  copy.req4_data_inb = req4_data_inb;
  copy.req1_cmd_in = req1_cmd_in;
  copy.req2_cmd_in = req2_cmd_in;
  copy.req3_cmd_in = req3_cmd_in;
  copy.req4_cmd_in = req4_cmd_in;
  copy.scan_in = scan_in;
  copy.a_clk = a_clk;
  copy.b_clk = b_clk;
  copy.c_clk = c_clk;
  copy.error_found = error_found;
  
endfunction
endclass
