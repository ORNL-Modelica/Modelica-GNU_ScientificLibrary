within GNU_ScientificLibrary.Examples.specfunc;

model SphBessel_jzeros "Zeros of Spherical Bessel functions"
  // example by tommy.burch@physik.uni-r.de
  extends Icons.Example;
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossj0 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossj1 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddj0(y_start = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, 54}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddj1(y_start = 1)  annotation(
    Placement(visible = true, transformation(origin = {60, -54}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.IntegerConstant integerConstant(k = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant enZj0(k = true)  annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant enZj1(k = true)  annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.SphBessel_jl sphBessel_j0(l = 0)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.SphBessel_jl sphBessel_j1(l = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_zeroJnu zeroj0(nu = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Blocks.specfunc.Bessel_zeroJnu zeroj1(nu = 1.5)  annotation(
    Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 20, height = 20)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(zeroCrossj0.y, trigAddj0.trigger) annotation(
    Line(points = {{41, 50}, {53, 50}}, color = {255, 0, 255}));
  connect(zeroCrossj1.y, trigAddj1.trigger) annotation(
    Line(points = {{42, -50}, {52, -50}}, color = {255, 0, 255}));
  connect(integerConstant.y, trigAddj0.u) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, 46}}, color = {255, 127, 0}));
  connect(integerConstant.y, trigAddj1.u) annotation(
    Line(points = {{42, 0}, {60, 0}, {60, -46}}, color = {255, 127, 0}));
  connect(enZj0.y, zeroCrossj0.enable) annotation(
    Line(points = {{22, 90}, {30, 90}, {30, 62}}, color = {255, 0, 255}));
  connect(enZj1.y, zeroCrossj1.enable) annotation(
    Line(points = {{22, -90}, {30, -90}, {30, -62}}, color = {255, 0, 255}));
  connect(sphBessel_j0.y, zeroCrossj0.u) annotation(
    Line(points = {{-19, 50}, {18, 50}}, color = {0, 0, 127}));
  connect(sphBessel_j1.y, zeroCrossj1.u) annotation(
    Line(points = {{-19, -50}, {18, -50}}, color = {0, 0, 127}));
  connect(ramp.y, sphBessel_j0.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(ramp.y, sphBessel_j1.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -50}, {-42, -50}}, color = {0, 0, 127}));
  connect(trigAddj0.y, zeroj0.i) annotation(
    Line(points = {{60, 62}, {60, 90}, {78, 90}}, color = {255, 127, 0}));
  connect(trigAddj1.y, zeroj1.i) annotation(
    Line(points = {{60, -62}, {60, -90}, {78, -90}}, color = {255, 127, 0}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 20, StartTime = 0, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    Documentation(info = "<html><head></head><body>Determination of zeros of spherical Bessel functions, j<sub>0</sub>(x<sub>i</sub>)=0 and j<sub>1</sub>(x<sub>i</sub>)=0, via Modelica/GSL and via direct GSL routines to compare.<div><br><div>Plots of zeroj0.y and zeroj1.y should display steps with lower-right corners at ( t , y ) = ( x<sub>i,Modelica</sub>&nbsp;, x<sub>i,GSL</sub>&nbsp;) and such values should be equal at these corners.</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/zerosJ3half.png\"></div></div><div><br></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The location of the zeros of spherical Bessel functions is a crucial element in some boundary value problems involving spherical symmetry&nbsp;</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">and this example shows how the 'Bessel_zeroJnu' block (with nu=n+1/2; n integer) provides said info quickly.</span></div><div><br></div><div>As not all special functions' zeros are provided via GSL routines, the displayed use of Modelica's zero-crossing logical blocks could be useful for finding such information for these other functions.</div></body></html>"));
end SphBessel_jzeros;