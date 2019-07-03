//package env;
//`include "/nfs/home/a/a_band/Desktop/calc1/driver.sv"
//`include "/nfs/home/a/a_band/Desktop/calc1/monitor.sv"
`include "/nfs/home/a/a_band/Questa/scoreboard.sv"
//import abc::*

class environment;
generator gen;
driver driv;
monitor mon;
scoreboard scb;
mailbox #(transaction) gen2driv,mon2scb,driv2scb;
virtual intf inf1;
 // custom constructor
 function new(virtual intf inf1);
 this.inf1 = inf1;
gen2driv=new();
mon2scb = new();
driv2scb = new();
 gen = new(gen2driv);
 driv = new(gen2driv,driv2scb,inf1);
mon = new(inf1,mon2scb);
scb = new(mon2scb,driv2scb);
 endfunction
 
 task intial_reset();
 driv.reset;
 endtask
 
 task gen_stim();
 fork
 gen.major;
 driv.run;
mon.mnt_main;
scb.main;
 join_none
 endtask
 
 task last();
 wait(gen.exit.triggered);
 wait(gen.iteration == driv.no_iterations);
 wait(gen.iteration == scb.count);
 endtask
 
 task start();
 intial_reset();
 gen_stim();
 last();
 endtask

endclass
//endpackage