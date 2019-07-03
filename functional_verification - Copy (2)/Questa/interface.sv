

interface intf(input c_clk);
logic [0:31] req1_data_in;
logic [0:31] req2_data_in;
logic [0:31] req3_data_in;
logic [0:31] req4_data_in;
logic [0:3] req1_cmd_in;
logic [0:3] req2_cmd_in;
logic [0:3] req3_cmd_in;
logic [0:3] req4_cmd_in;
logic [1:7] reset;
logic scan_in;
logic scan_out;
logic [0:3] error_found;
logic a_clk, b_clk;
logic [0:1] out_resp1;
logic [0:1] out_resp2;
logic [0:1] out_resp3;
logic [0:1] out_resp4;
logic [0:31] out_data1;
logic [0:31] out_data2;
logic [0:31] out_data3;
logic [0:31] out_data4;


//clocking block
clocking cb @(posedge c_clk);
input out_data1;
input out_data2;
input out_data3;
input out_data4;
input out_resp1;
input out_resp2;
input out_resp3;
input out_resp4;
input scan_out;
output a_clk;
output b_clk;
output error_found;
output req1_cmd_in;
output req1_data_in;
output req2_cmd_in;
output req2_data_in;
output req3_cmd_in;
output req3_data_in;
output req4_cmd_in;
output req4_data_in;
output reset;
output scan_in;


endclocking 

clocking monitor_cb @(posedge c_clk);
input out_data1;
input out_data2;
input out_data3;
input out_data4;
input out_resp1;
input out_resp2;
input out_resp3;
input out_resp4;
input scan_out;
input a_clk;
input b_clk;
input error_found;
input req1_cmd_in;
input req1_data_in;
input req2_cmd_in;
input req2_data_in;
input req3_cmd_in;
input req3_data_in;
input req4_cmd_in;
input req4_data_in;
input reset;
input scan_in;


endclocking 


modport TEST(clocking cb);
modport DUT(output out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4, scan_out, 
input a_clk, b_clk, c_clk, error_found, req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, reset, scan_in);

endinterface
