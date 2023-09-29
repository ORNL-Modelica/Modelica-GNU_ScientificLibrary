within GNU_ScientificLibrary.Examples.specfunc;

model Bessel_Yzeros "Zeros of Bessel functions"
  // example by tommy.burch@physik.uni-r.de
  extends Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 19.9, height = 19.9, offset = 0.1, startTime = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-80, -10}, {-60, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossY0 annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossY1 annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddY0(y_start = 1) annotation(
    Placement(visible = true, transformation(origin = {60, 54}, extent = {{-6, 6}, {6, -6}}, rotation = 90)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddY1(y_start = 1) annotation(
    Placement(visible = true, transformation(origin = {60, -34}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Sources.IntegerConstant integerConstant(k = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanConstant enZYn(k = true) annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Blocks.specfunc.Bessel_Yn bessel_Y0(l = 0) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y2(l = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossY2 annotation(
    Placement(visible = true, transformation(origin = {16, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Y3(l = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossY3 annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddY2 annotation(
    Placement(visible = true, transformation(origin = {46, -64}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.MathInteger.TriggeredAdd trigAddY3 annotation(
    Placement(visible = true, transformation(origin = {66, -94}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
equation
  connect(ramp.y, bessel_Y0.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(ramp.y, bessel_Y1.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -30}, {-42, -30}}, color = {0, 0, 127}));
  connect(bessel_Y0.y, zeroCrossY0.u) annotation(
    Line(points = {{-18, 50}, {18, 50}}, color = {0, 0, 127}));
  connect(bessel_Y1.y, zeroCrossY1.u) annotation(
    Line(points = {{-19, -30}, {17, -30}}, color = {0, 0, 127}));
  connect(zeroCrossY1.y, trigAddY1.trigger) annotation(
    Line(points = {{41, -30}, {51, -30}}, color = {255, 0, 255}));
  connect(zeroCrossY0.y, trigAddY0.trigger) annotation(
    Line(points = {{42, 50}, {52, 50}}, color = {255, 0, 255}));
  connect(integerConstant.y, trigAddY1.u) annotation(
    Line(points = {{41, 10}, {60, 10}, {60, -26}}, color = {255, 127, 0}));
  connect(integerConstant.y, trigAddY0.u) annotation(
    Line(points = {{42, 10}, {60, 10}, {60, 46}}, color = {255, 127, 0}));
  connect(enZYn.y, zeroCrossY0.enable) annotation(
    Line(points = {{22, 90}, {30, 90}, {30, 62}}, color = {255, 0, 255}));
  connect(enZYn.y, zeroCrossY1.enable) annotation(
    Line(points = {{22, 90}, {80, 90}, {80, -50}, {30, -50}, {30, -42}}, color = {255, 0, 255}));
  connect(ramp.y, bessel_Y2.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -60}, {-42, -60}}, color = {0, 0, 127}));
  connect(bessel_Y2.y, zeroCrossY2.u) annotation(
    Line(points = {{-18, -60}, {4, -60}}, color = {0, 0, 127}));
  connect(enZYn.y, zeroCrossY2.enable) annotation(
    Line(points = {{22, 90}, {80, 90}, {80, -80}, {16, -80}, {16, -72}}, color = {255, 0, 255}));
  connect(ramp.y, bessel_Y3.x) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -90}, {-42, -90}}, color = {0, 0, 127}));
  connect(bessel_Y3.y, zeroCrossY3.u) annotation(
    Line(points = {{-18, -90}, {-12, -90}}, color = {0, 0, 127}));
  connect(zeroCrossY2.y, trigAddY2.trigger) annotation(
    Line(points = {{28, -60}, {38, -60}}, color = {255, 0, 255}));
  connect(integerConstant.y, trigAddY2.u) annotation(
    Line(points = {{42, 10}, {46, 10}, {46, -56}}, color = {255, 127, 0}));
  connect(zeroCrossY3.y, trigAddY3.trigger) annotation(
    Line(points = {{12, -90}, {58, -90}}, color = {255, 0, 255}));
  connect(integerConstant.y, trigAddY3.u) annotation(
    Line(points = {{42, 10}, {74, 10}, {74, -70}, {66, -70}, {66, -86}}, color = {255, 127, 0}));
  connect(enZYn.y, zeroCrossY3.enable) annotation(
    Line(points = {{22, 90}, {80, 90}, {80, -106}, {0, -106}, {0, -102}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 20, StartTime = 0, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    Documentation(info = "<html><head></head><body>Determination of zeros of Bessel functions, Y<font size=\"2\"><sub>n</sub></font>(x<font size=\"2\"><sub>n,i</sub></font>)=0 (for n=0..3), via Modelica/GSL.<br><div><br></div><div>The location of the zeros of Bessel functions is a crucial element in some boundary value problems involving cylindrical symmetry.</div><div><br></div><div>As not all special functions' zeros are provided via GSL routines, the displayed use of Modelica's zero-crossing logical blocks could be useful for finding such information for these other functions.</div></body></html>"));
end Bessel_Yzeros;