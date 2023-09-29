within GNU_ScientificLibrary.Examples.specfunc;

model Bessel_1stKind
  extends Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 20, height = 20) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_J0 bessel_J0 annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Jn bessel_J1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Blocks.specfunc.Bessel_Jn bessel_J2(l = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_In bessel_I0(l = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_In bessel_I1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_In bessel_I2(l = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, bessel_J0.x) annotation(
    Line(points = {{-58, 0}, {-50, 0}, {-50, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_J1.x) annotation(
    Line(points = {{-58, 0}, {-10, 0}, {-10, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_J2.x) annotation(
    Line(points = {{-58, 0}, {30, 0}, {30, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_I0.x) annotation(
    Line(points = {{-58, 0}, {-50, 0}, {-50, -50}, {-42, -50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_I1.x) annotation(
    Line(points = {{-58, 0}, {-10, 0}, {-10, -50}, {-2, -50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_I2.x) annotation(
    Line(points = {{-58, 0}, {30, 0}, {30, -50}, {38, -50}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 20, StartTime = 0, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
  Documentation(info = "<html><head></head><body>Example execution of blocks for Bessel functions of the 1st kind (for n=0,1,2).</body></html>"));
end Bessel_1stKind;