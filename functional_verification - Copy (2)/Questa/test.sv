

`include "/nfs/home/a/a_band/Questa/environment.sv"

program automatic test(intf.TEST intf2);

  environment env;

initial
begin
  env = new(intf2);
env.gen.iteration = 20;
 env.start();
end
endprogram
