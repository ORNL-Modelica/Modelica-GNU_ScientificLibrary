within GNU_ScientificLibrary.Examples.integration.IntegratingCircuit;

model CircuitIntegrand "Create integrand voltage for integration circuit"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  //
  parameter String C_integrand = "par[0]*(1-exp(-par[1]*x))*exp(-par[2]*x)" 
    "Integrand in C-code, =f(x)";
  //
  Integer rcode[2];
initial equation
// "initial" function call to compile (only once) C-code of integrand and
//   GSL-integration/Modelica interface
  rcode = Functions.integration.integrand_setup(C_integrand);
equation
// dummy equations to "model" integrand setup (compilation)
  rcode[1] = 0;
  rcode[2] = 0;
  annotation(
    Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = C_integrand)}),
    preferredView = "text",
    Documentation(info = "<html><head></head><body>Integrand-setup \"model\" for integrator-circuit input voltage.<div><br><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>input voltage: &nbsp;V<sub>0</sub> (1 - e<sup>-t/&tau;1</sup>) e<sup>-t/&tau;2</sup>&nbsp;</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>in C-syntax: \"par[0]*(1-exp(-par[1]*x))*exp(-par[2]*x)\"&nbsp;<div><div><br></div><div>Note the possibility to place parameters (always with 'par' and always starting with index 0). The values of these can then be set during the larger model runtime (see the integration blocks).</div><div><br></div><div>Wherever possible, Modelica.Utilities routines are used to handle file / system commands. The current exception is the use of 'gcc' to compile the libgsl_integration_MI.so / libgsl_integration_MI.dll library. This is standard on any Linux system and is available for any Windows system via 'mingw'.</div></div><div><br></div><div>Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:&nbsp;</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows]</div></div></div></body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 1));
end CircuitIntegrand;