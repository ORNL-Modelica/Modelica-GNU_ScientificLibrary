within GNU_ScientificLibrary.Examples.specfunc;

model Bessel_2ndKind
  extends Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 19, height = 19, offset = 1, startTime = 1) annotation(
    Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y0(l = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y2(l = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Kn bessel_K0(l = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Kn bessel_K1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Kn bessel_K2(l = 2) annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, bessel_Y0.x) annotation(
    Line(points = {{-58, 0}, {-50, 0}, {-50, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_Y1.x) annotation(
    Line(points = {{-58, 0}, {-10, 0}, {-10, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_Y2.x) annotation(
    Line(points = {{-58, 0}, {30, 0}, {30, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_K0.x) annotation(
    Line(points = {{-58, 0}, {-50, 0}, {-50, -50}, {-42, -50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_K1.x) annotation(
    Line(points = {{-58, 0}, {-10, 0}, {-10, -50}, {-2, -50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_K2.x) annotation(
    Line(points = {{-58, 0}, {30, 0}, {30, -50}, {38, -50}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 20, StartTime = 1, Tolerance = 1e-06, Interval = 0.038),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
  Documentation(info = "<html><head></head><body>Example execution of blocks for Bessel functions of the 2nd kind (for n=0,1,2).</body></html>"));
end Bessel_2ndKind;