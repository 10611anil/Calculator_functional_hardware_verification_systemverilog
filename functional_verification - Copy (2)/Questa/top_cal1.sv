// Author : Anil Kumar
// Date : 03/21/2019
// The functional verification of calculator design, instantiated design_top_file, test_top_file and interface. 


module top;
  parameter simulation_cycle = 100;
  
  bit c_clk;
  always #(simulation_cycle/2) 
    c_clk = ~c_clk;

  intf intf_cal1(c_clk); // APB interafce
  test t1(intf_cal1.TEST);
calc1_top m1 (.out_data1(intf_cal1.out_data1), .out_data2(intf_cal1.out_data2), .out_data3(intf_cal1.out_data3), .out_data4(intf_cal1.out_data4), 
				.out_resp1(intf_cal1.out_resp1), .out_resp2(intf_cal1.out_resp2), .out_resp3(intf_cal1.out_resp3), .out_resp4(intf_cal1.out_resp4), 
			 
				.scan_out(intf_cal1.scan_out), .error_found(error_found),
				.a_clk(intf_cal1.a_clk), .b_clk(intf_cal1.b_clk), .c_clk(c_clk), 
				.req1_cmd_in(intf_cal1.req1_cmd_in), .req1_data_in(intf_cal1.req1_data_in), 
				.req2_cmd_in(intf_cal1.req2_cmd_in), .req2_data_in(intf_cal1.req2_data_in), 
				.req3_cmd_in(intf_cal1.req3_cmd_in), .req3_data_in(intf_cal1.req3_data_in),
				.req4_cmd_in(intf_cal1.req4_cmd_in), .req4_data_in(intf_cal1.req4_data_in),
				.reset(intf_cal1.reset), .scan_in(intf_cal1.scan_in));

endmodule 
