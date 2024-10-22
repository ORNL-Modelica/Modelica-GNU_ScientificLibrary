within GNU_ScientificLibrary.Examples.specfunc;

model ErfComparison "Comparison of erf(x) from GSL and Modelica"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp x_ramp(height = 2, duration = 2)  annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}})));
  Blocks.specfunc.Erf erf annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add diff(k2 = -1)  annotation(
    Placement(transformation(origin = {50, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression erf_mod(y = Modelica.Math.Special.erf(x_ramp.y))  annotation(
    Placement(transformation(origin = {-10, -30}, extent = {{-30, -10}, {30, 10}})));
equation
  connect(x_ramp.y, erf.x) annotation(
    Line(points = {{-19, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(erf.y, diff.u1) annotation(
    Line(points = {{22, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(erf_mod.y, diff.u2) annotation(
    Line(points = {{23, -30}, {30, -30}, {30, -2}, {38, -2}}, color = {0, 0, 127}));
annotation(
    Diagram(coordinateSystem(extent = {{-60, 20}, {60, -40}})),
  experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.004),
  Documentation(info = "<html><head></head><body>Comparison of error functions, erf(x), from GSL and Modelica.Math.Special, resulting in agreement to machine precision:<div><br></div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/erf_gsl_vs_mod.png\"></div></body></html>"));
end ErfComparison;