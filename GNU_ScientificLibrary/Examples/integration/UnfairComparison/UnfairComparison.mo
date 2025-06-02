within GNU_ScientificLibrary.Examples.integration.UnfairComparison;

model UnfairComparison "Comparison of GSL and Modelica integration routines"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Integer n_par = 1;
  parameter Real b = 1, rel_err = 1.e-7, par[n_par] = {1.0};
  parameter Integer limit = 1000;
  Real a, z;
  Modelica.Blocks.Sources.Ramp a_ramp(duration = 0.1, height = -0.1, offset = 0.100001, startTime = 0) annotation(
    Placement(transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression res_from_Mod(y = z)  annotation(
    Placement(transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division iiratio annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
  //
  function func
    extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
    input Integer n_p;
    input Real p[n_p];
  algorithm
    y := GNU_ScientificLibrary.Functions.integration.integrand(u,n_p,p);
  end func;
  //
  Blocks.integration.QAGS_quadrature qAGS_quad(n_par = n_par)  annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant p_const[n_par](k = {1.0})  annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant b_const(k = b)  annotation(
    Placement(transformation(origin = {-60, -36}, extent = {{-10, -10}, {10, 10}})));
  Blocks.integration.QAGS_quadrature qAGS_quad0(n_par = n_par)  annotation(
    Placement(transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const0(k = 0)  annotation(
    Placement(transformation(origin = {-60, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  a = a_ramp.y;
  z = Modelica.Math.Nonlinear.quadratureLobatto(function func(n_p = n_par, p = par), a, b, rel_err);
  connect(res_from_Mod.y, iiratio.u1) annotation(
    Line(points = {{21, 0}, {30, 0}, {30, -4}, {38, -4}}, color = {0, 0, 127}));
  connect(qAGS_quad.y, iiratio.u2) annotation(
    Line(points = {{22, -30}, {30, -30}, {30, -16}, {38, -16}}, color = {0, 0, 127}));
  connect(p_const.y, qAGS_quad.par) annotation(
    Line(points = {{-19, 10}, {-10, 10}, {-10, -24}, {-2, -24}}, color = {0, 0, 127}, thickness = 0.5));
  connect(a_ramp.y, qAGS_quad.a) annotation(
    Line(points = {{-18, -20}, {-14, -20}, {-14, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(p_const.y, qAGS_quad0.par) annotation(
    Line(points = {{-18, 10}, {-10, 10}, {-10, 36}, {-2, 36}}, color = {0, 0, 127}, thickness = 0.5));
  connect(b_const.y, qAGS_quad.b) annotation(
    Line(points = {{-49, -36}, {-2, -36}}, color = {0, 0, 127}));
  connect(const0.y, qAGS_quad0.a) annotation(
    Line(points = {{-49, 30}, {-2, 30}}, color = {0, 0, 127}));
  connect(b_const.y, qAGS_quad0.b) annotation(
    Line(points = {{-49, -36}, {-6, -36}, {-6, 24}, {-2, 24}}, color = {0, 0, 127}));
  annotation(
    preferredView = "diagram",
    Documentation(info = "<html><head></head><body><div>Example integral:&nbsp;</div><div><br></div><div>I(a) = ∫<sub>a</sub><sup>1</sup> x<sup>-1/2</sup> ln(x) dx&nbsp;</div><div><br></div><div>using the GSL QAGS routine and Modelica.Math.Nonlinear.quadratureLobatto(). Several values of a from 0.1 to 10<sup>-6</sup> are explored and the integral is reevaluated for each one. The ratio of the results from the two methods is also calculated for comparison. As the integrand contains a singularity at x=0, the integration is stopped at a=10<sup>-6</sup>. Only the QAGS result is evaluated for the full range (qAGS_quad0.y = I(0) = -4). The Lobatto routine will hang or crash for values of a &lt; 10<sup>-6</sup>.</div><div><br></div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand2' (or a duplicate) must be run before using GSL integration routines within a larger Modelica model (like this one). (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:<div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div><div><br><div><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/qags_mod_compar.png\"></div><div><div><br></div></div></div></body></html>"),
    experiment(StartTime = 0, StopTime = 0.1, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-80, 40}, {60, -60}})));
end UnfairComparison;