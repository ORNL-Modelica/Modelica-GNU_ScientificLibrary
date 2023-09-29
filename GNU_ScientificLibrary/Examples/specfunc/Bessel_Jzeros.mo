within GNU_ScientificLibrary.Examples.specfunc;

model Bessel_Jzeros "Zeros of Bessel functions"
  // example by tommy.burch@physik.uni-r.de
  extends Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 20, height = 20) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_J0 bessel_J0 annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Jn bessel_J1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_zeroJnu zeroJ0(nu = 0.0) annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_zeroJnu zeroJ1(nu = 1.0) annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossJ0 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossJ1 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddJ0(y_start = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, 54}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddJ1(y_start = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, -54}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.IntegerConstant integerConstant(k = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant enZJ0(k = true)  annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant enZJ1(k = true)  annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bessel_J0.y, zeroCrossJ0.u) annotation(
    Line(points = {{-19, 50}, {18, 50}}, color = {0, 0, 127}));
  connect(bessel_J1.y, zeroCrossJ1.u) annotation(
    Line(points = {{-19, -50}, {18, -50}}, color = {0, 0, 127}));
  connect(zeroCrossJ0.y, trigAddJ0.trigger) annotation(
    Line(points = {{41, 50}, {53, 50}}, color = {255, 0, 255}));
  connect(zeroCrossJ1.y, trigAddJ1.trigger) annotation(
    Line(points = {{42, -50}, {52, -50}}, color = {255, 0, 255}));
  connect(integerConstant.y, trigAddJ0.u) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, 46}}, color = {255, 127, 0}));
  connect(integerConstant.y, trigAddJ1.u) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, -46}}, color = {255, 127, 0}));
  connect(enZJ0.y, zeroCrossJ0.enable) annotation(
    Line(points = {{22, 90}, {30, 90}, {30, 62}}, color = {255, 0, 255}));
  connect(enZJ1.y, zeroCrossJ1.enable) annotation(
    Line(points = {{22, -90}, {30, -90}, {30, -62}}, color = {255, 0, 255}));
  connect(ramp.y, bessel_J0.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_J1.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -50}, {-42, -50}}, color = {0, 0, 127}));
  connect(trigAddJ0.y, zeroJ0.i) annotation(
    Line(points = {{60, 62}, {60, 90}, {78, 90}}, color = {255, 127, 0}));
  connect(trigAddJ1.y, zeroJ1.i) annotation(
    Line(points = {{60, -62}, {60, -90}, {78, -90}}, color = {255, 127, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 20, StartTime = 0, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    Documentation(info = "<html><head></head><body>Determination of zeros of Bessel functions, J<sub>0</sub>(x<font size=\"2\"><sub>i</sub></font>)=0 and J<sub>1</sub>(x<font size=\"2\"><sub>i</sub></font>)=0, via Modelica/GSL and via direct GSL functions to compare results.
<div><br></div><div>Plots of zeroJ0.y and zeroJ1.y should display steps with lower-right corners at ( t , y ) = ( x<sub>i,Modelica</sub>&nbsp;, x<sub>i,GSL</sub>&nbsp;) and such values should be equal at these corners.</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/zerosJ0.png\"></div><div><br></div><div>The location of the zeros of Bessel functions is a crucial element in some boundary value problems involving cylindrical symmetry and this example shows how the 'Bessel_zeroJnu' block (with nu=n; n integer) provides said info quickly.</div><div><br></div><div>As not all special functions' zeros are provided via GSL routines, the displayed use of Modelica's zero-crossing logical blocks could be useful for finding such information for these other functions.</div></body></html>"));
end Bessel_Jzeros;