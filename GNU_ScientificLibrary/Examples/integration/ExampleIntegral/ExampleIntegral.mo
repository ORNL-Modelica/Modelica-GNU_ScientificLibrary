within GNU_ScientificLibrary.Examples.integration.ExampleIntegral;

model ExampleIntegral "Example integration using GSL"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Integer n_par = 1;
  parameter Real a = 0, rel_err = 1.e-6;
  parameter Integer limit = 1000, key = 6;
  Modelica.Blocks.Sources.Ramp b_ramp(duration = 0.99, height = 0.99, offset = 0.01, startTime = 0.01)  annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain I_qag(k = 2.0/sqrt(Modelica.Constants.pi))  annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division iiratio annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant a_const(k = a)  annotation(
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant p_const[n_par](k = {1})  annotation(
    Placement(transformation(origin = {-70, -36}, extent = {{-10, -10}, {10, 10}})));
  Blocks.integration.QAG_quadrature qAG_quad(n_par = n_par)  annotation(
    Placement(transformation(origin = {-30, -30}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Blocks.specfunc.Erf erf_gsl annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(I_qag.y, iiratio.u2) annotation(
    Line(points = {{22, -30}, {30, -30}, {30, -16}, {38, -16}}, color = {0, 0, 127}));
  connect(b_ramp.y, qAG_quad.b) annotation(
    Line(points = {{-18, 10}, {-10, 10}, {-10, -10}, {-48, -10}, {-48, -24}, {-42, -24}}, color = {0, 0, 127}));
  connect(p_const.y, qAG_quad.par) annotation(
    Line(points = {{-58, -36}, {-42, -36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(a_const.y, qAG_quad.a) annotation(
    Line(points = {{-58, 0}, {-52, 0}, {-52, -30}, {-42, -30}}, color = {0, 0, 127}));
  connect(qAG_quad.y, I_qag.u) annotation(
    Line(points = {{-18, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(b_ramp.y, erf_gsl.x) annotation(
    Line(points = {{-18, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(erf_gsl.y, iiratio.u1) annotation(
    Line(points = {{22, 10}, {30, 10}, {30, -4}, {38, -4}}, color = {0, 0, 127}));
  annotation(
    preferredView = "diagram",
    Documentation(info = "<html><head></head><body><div>Example integral:&nbsp;</div><div><br></div><div>I(b) = 2/sqrt(pi) ∫<sub>0</sub><sup>b</sup> exp(-x*x) dx&nbsp;</div><div><br></div><div>using the GSL QAG routine and a comparison with the known result: erf(b). Several values of b from 0.01 to 1 are explored and the integral is reevaluated for each one. The ratio of I(b)/erf(b) is also calculated and is always consistent with 1.</div><div><br></div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand' (or a duplicate) must be run before using GSL integration routines within a larger Modelica model (like this one). (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:<div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div><div><br><div><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/Iqag_vs_b.png\"></div><div><div><br></div><div>For the relevant meanings of the 'rel_err', 'limit', 'key', etc., see the 'qag' function and:</div><div><br></div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qag.png\"></div></div></div></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.01),
  Diagram(coordinateSystem(extent = {{-80, 20}, {60, -60}})));
end ExampleIntegral;