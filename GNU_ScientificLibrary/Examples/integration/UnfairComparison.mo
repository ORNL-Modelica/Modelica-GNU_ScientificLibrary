within GNU_ScientificLibrary.Examples.integration;

model UnfairComparison "Comparison of GSL and Modelica integration routines"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Real b = 1, rel_err = 1.e-7;
  parameter Integer limit = 1000;
  Real a, y, err, z, y0, err0, kludge;
  Modelica.Blocks.Sources.Ramp a_ramp(duration = 0.1, height = -0.1, offset = 0.100001, startTime = 0) annotation(
    Placement(transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression res_from_qags(y = y) annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression res_from_Mod(y = z)  annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division iiratio annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
    
  function func
    extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
  algorithm
    y := GNU_ScientificLibrary.Functions.integration.integrand(u);
  end func;
equation
  a = a_ramp.y;
  // kludge: a direct call to a GSL function appears to be required to have libgsl 
  //  load along with the interface 
  kludge = GNU_ScientificLibrary.Functions.specfunc.erf(a);
  // 
  (y, err) = GNU_ScientificLibrary.Functions.integration.qags(a, b, rel_err, limit);
  (y0, err0) = GNU_ScientificLibrary.Functions.integration.qags(0, b, rel_err, limit);
  z = Modelica.Math.Nonlinear.quadratureLobatto(function func(), a, b, rel_err);
  connect(res_from_qags.y, iiratio.u2) annotation(
    Line(points = {{22, -30}, {30, -30}, {30, -16}, {38, -16}}, color = {0, 0, 127}));
  connect(res_from_Mod.y, iiratio.u1) annotation(
    Line(points = {{22, 10}, {30, 10}, {30, -4}, {38, -4}}, color = {0, 0, 127}));
  annotation(
    Library = "libgsl",
    Documentation(info = "<html><head></head><body><div>Example integral:&nbsp;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp;/<sup>1</sup>&nbsp;</div><div>I(a) = | x<sup>-1/2</sup> ln(x) dx&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp;/<sub>a</sub>&nbsp;</div><div><br></div><div>using the GSL QAGS routine and Modelica.Math.Nonlinear.quadratureLobatto(). Several values of a from 0.1 to 10<sup>-6</sup> are explored and the integral is reevaluated for each one. The ratio of the results from the two methods is also calculated for comparison. As the integrand contains a singularity at x=0, the integration is stopped at a=10<sup>-6</sup>. Only the QAGS result is evaluated for the full range (y0 = I(0)). The Lobatto routine will hang or crash for smaller values of a.</div><div><br></div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand2' (or a duplicate) must be run before using GSL integration routines within a larger Modelica model (like this one). (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:<div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div><div><br><div><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/qags_mod_compar.png\"></div><div><div><br></div></div></div></body></html>"),
    experiment(StartTime = 0, StopTime = 0.1, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-40, 20}, {60, -40}})));
end UnfairComparison;