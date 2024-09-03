within GNU_ScientificLibrary.Examples.integration;

model ExampleIntegral "Example integration using GSL"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Real a = 0, rel_err = 1.e-6;
  parameter Integer limit = 100, key = 6;
  Real b,y,err;
  Modelica.Blocks.Sources.Ramp x_ramp(duration = 0.99, height = 0.99, offset = 0.01, startTime = 0.01)  annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}})));
  Blocks.specfunc.Erf erf_gsl annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression res_from_qag(y = y)  annotation(
    Placement(transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain I_qag(k = 2.0/sqrt(Modelica.Constants.pi))  annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division iiratio annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  b = x_ramp.y;
  (y,err) = GNU_ScientificLibrary.Functions.integration.qag(a,b,rel_err,limit,key);
  connect(x_ramp.y, erf_gsl.x) annotation(
    Line(points = {{-18, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(res_from_qag.y, I_qag.u) annotation(
    Line(points = {{-18, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(erf_gsl.y, iiratio.u1) annotation(
    Line(points = {{22, 10}, {30, 10}, {30, -4}, {38, -4}}, color = {0, 0, 127}));
  connect(I_qag.y, iiratio.u2) annotation(
    Line(points = {{22, -30}, {30, -30}, {30, -16}, {38, -16}}, color = {0, 0, 127}));
annotation(
    Documentation(info = "<html><head></head><body><div>Example integral:&nbsp;</div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /<sup>b</sup>&nbsp;</div><div>I(b) = 2/sqrt(pi) |&nbsp;exp(-x*x) dx&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /<sub>0</sub>&nbsp;</div><div><br></div><div>using the GSL QAG routine and a comparison with the known result: erf(b). Several values of b from 0.01 to 1 are explored and the integral is reevaluated for each one. The ratio of I(b)/erf(b) is also calculated and is always consistent with 1.</div><div><br></div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand' (or a duplicate) must be run before using GSL integration routines within a larger Modelica model (like this one).<div><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/Iqag_vs_b.png\"></div><div><div><br></div><div>For the relevant meanings of the 'rel_err', 'limit', 'key', etc., see the 'qag' function and:</div><div><br></div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qag.png\"></div></div></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01),
  Diagram(coordinateSystem(extent = {{-40, 20}, {60, -40}})));
end ExampleIntegral;