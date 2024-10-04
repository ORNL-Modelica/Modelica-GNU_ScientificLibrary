within GNU_ScientificLibrary.Examples.specfunc;

model ExpTranscendEqs "Solution of Exponential-Transendental Equation"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp x_ramp(duration = 1, height = params.delta_x, offset = params.x_min)  annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min min annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Lambert_W0 w0 annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Lambert_Wm1 wm1 annotation(
    Placement(visible = true, transformation(origin = {20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Exp exp annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product prod_cx annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  record Params
    extends Modelica.Icons.Record;
    final constant Real x_min = -1.0/Modelica.Constants.e;
    final constant Real x_zero = -1.e-6;
    parameter Real x_max = 10;
    parameter Real a = 1.0;
    parameter Real b = 1.0 "must NOT be zero";
    parameter Real c = 0.1 "must NOT be zero";
    final parameter Real delta_x = x_max - x_min "do NOT change";
    final parameter Real w_arg = -b*c*Modelica.Constants.e^(a*c) "do NOT change";
  end Params;
  Modelica.Blocks.Math.Product prod_becx annotation(
    Placement(visible = true, transformation(origin = {10, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add_a annotation(
    Placement(visible = true, transformation(origin = {50, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_c(k = params.c)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_b(k = params.b)  annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_a(k = params.a)  annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_bceac(k = params.w_arg)  annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Params params annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant x_zero_minus(k = params.x_zero) annotation(
    Placement(visible = true, transformation(origin = {-50, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant x_min(k = params.x_min)  annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Max max annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product prod_1c annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add res0 annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_1c(k = -1.0/params.c)  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Blocks.specfunc.NumericalInversions.SolveExpTranscend solveExpTranscend annotation(
    Placement(transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(x_ramp.y, prod_cx.u2) annotation(
    Line(points = {{-78, 50}, {-70, 50}, {-70, 64}, {-62, 64}}, color = {0, 0, 127}));
  connect(const_c.y, prod_cx.u1) annotation(
    Line(points = {{-78, 90}, {-70, 90}, {-70, 76}, {-62, 76}}, color = {0, 0, 127}));
  connect(prod_cx.y, exp.u) annotation(
    Line(points = {{-38, 70}, {-32, 70}}, color = {0, 0, 127}));
  connect(exp.y, prod_becx.u1) annotation(
    Line(points = {{-8, 70}, {-2, 70}}, color = {0, 0, 127}));
  connect(const_b.y, prod_becx.u2) annotation(
    Line(points = {{-18, 40}, {-10, 40}, {-10, 58}, {-2, 58}}, color = {0, 0, 127}));
  connect(prod_becx.y, add_a.u1) annotation(
    Line(points = {{22, 64}, {38, 64}}, color = {0, 0, 127}));
  connect(const_bceac.y, max.u1) annotation(
    Line(points = {{-78, -10}, {-70, -10}, {-70, -24}, {-62, -24}}, color = {0, 0, 127}));
  connect(x_min.y, max.u2) annotation(
    Line(points = {{-78, -50}, {-70, -50}, {-70, -36}, {-62, -36}}, color = {0, 0, 127}));
  connect(max.y, w0.x) annotation(
    Line(points = {{-38, -30}, {-22, -30}}, color = {0, 0, 127}));
  connect(x_zero_minus.y, min.u2) annotation(
    Line(points = {{-38, -70}, {-30, -70}, {-30, -76}, {-22, -76}}, color = {0, 0, 127}));
  connect(max.y, min.u1) annotation(
    Line(points = {{-38, -30}, {-30, -30}, {-30, -64}, {-22, -64}}, color = {0, 0, 127}));
  connect(min.y, wm1.x) annotation(
    Line(points = {{2, -70}, {8, -70}}, color = {0, 0, 127}));
  connect(const_a.y, add_a.u2) annotation(
    Line(points = {{22, 30}, {30, 30}, {30, 52}, {38, 52}}, color = {0, 0, 127}));
  connect(const_1c.y, prod_1c.u1) annotation(
    Line(points = {{2, 0}, {10, 0}, {10, -24}, {18, -24}}, color = {0, 0, 127}));
  connect(w0.y, prod_1c.u2) annotation(
    Line(points = {{2, -30}, {10, -30}, {10, -36}, {18, -36}}, color = {0, 0, 127}));
  connect(const_a.y, res0.u1) annotation(
    Line(points = {{22, 30}, {50, 30}, {50, -24}, {58, -24}}, color = {0, 0, 127}));
  connect(prod_1c.y, res0.u2) annotation(
    Line(points = {{42, -30}, {50, -30}, {50, -36}, {58, -36}}, color = {0, 0, 127}));
  connect(const_b.y, solveExpTranscend.b) annotation(
    Line(points = {{-18, 40}, {-10, 40}, {-10, 46}, {70, 46}, {70, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(const_c.y, solveExpTranscend.c) annotation(
    Line(points = {{-78, 90}, {66, 90}, {66, 4}, {78, 4}}, color = {0, 0, 127}));
  connect(const_a.y, solveExpTranscend.a) annotation(
    Line(points = {{22, 30}, {74, 30}, {74, 16}, {78, 16}}, color = {0, 0, 127}));
protected  annotation(
    Diagram(coordinateSystem(extent = {{-100, 100}, {100, -80}})),
    Documentation(info = "<html><head></head><body>Exponential transcendental equations of the form,<div><br><div>x = a + b e<sup>cx</sup></div><div><sup><br></sup></div><div>may be solved using the Lambert W functions:</div><div><br></div><div>x<sub>k</sub> = a - W<sub>k</sub>(-bc e<sup>ac</sup>) / c&nbsp;</div><div><br></div><div>where W(y) is a solution of: W(y) e<sup>W(y)</sup>&nbsp;= y .</div><div><br></div><div>If the argument of the W function is real and between -1/e and 0, then there are two real values: W<sub>0</sub>&nbsp;(&gt; -1) and W<sub>-1</sub>&nbsp;(&lt; -1).</div><div>If the argument is real and &gt;=0, then there is one real value: W<sub>0</sub>.</div></div><div><br></div><div>In this example, x values are produced in a ramp source. Both sides of the equation are produced: y=x and z=a+be<sup>cx</sup>. The result, r<sub>0</sub>=a-W<sub>0</sub>(-bce<sup>ac</sup>)/c, is also determined and all three meet at the appropriate point:</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/expTranscendEq.png\"></div><div><br></div><div>This type of solver is coded into the \"SolveExpTranscend\" block under the \"NumericalInversions\" package. The use of this block on the far right reveals that there is a 2nd solution from W<sub>-1</sub> at x~35.</div></body></html>"));
end ExpTranscendEqs;