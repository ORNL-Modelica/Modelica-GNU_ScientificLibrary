within GNU_ScientificLibrary.Examples.integration;

model CreateIntegrand "Create integrand for integration using GSL"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  
  parameter String C_integrand = "exp(-x*x)" 
    "Integrand in C-code, =f(x)";
    
  Integer rcode[2];
initial equation
// "initial" function call to compile (only once) C-code of integrand and
//   GSL-integration/Modelica interface
  rcode = Functions.integration.integrand_setup(C_integrand);
equation
  // dummy equations to "model" integrand setup (compilation)
  rcode[1] = 0;
  rcode[2] = 0;
  annotation(Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString=C_integrand)}),
    Documentation(info = "<html><head></head><body>Integrand-setup \"model\" for using GSL integration routines within a larger Modelica model.<div><br></div><div>USAGE: To create a different integrand function, simply duplicate this model and change the String 'C_integrand' for the desired mathematical function in standard C-syntax. This model then needs to be \"simulated\" (it actually only copies/creates files, compiles and archives them) before the larger model, which may then include multiple uses of the relevant 'integrand' (e.g., in qag or other GSL routines).<br><div><div><br></div><div>Wherever possible, Modelica.Utilities routines are used to handle file / system commands. The current exception is the use of 'gcc' to compile the libgsl_integration_MI.so / libgsl_integration_MI.dll library. This is standard on any Linux system and is available for any Windows system via 'mingw'.</div></div></div></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1));
end CreateIntegrand;
