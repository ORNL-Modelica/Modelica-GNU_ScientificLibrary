within GNU_ScientificLibrary.Examples.specfunc;

model CoaxialDirichlet "Coaxial Dirichlet Boundary-Value Problem"
  // example by tommy.burch@physik.uni-r.de
  // extends Modelica.Icons.Example;
  extends Modelica.Icons.UnderConstruction;
  parameter Real x1 = 1, x2 = 20;
  Modelica.Blocks.Sources.Ramp x_ramp(duration = 1, height = x2 - x1, offset = x1, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_In bessel_In(l = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Kn bessel_Kn(l = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Blocks.specfunc.Bessel_Jn bessel_Jn(l = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.Bessel_Yn bessel_Yn(l = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(x_ramp.y, bessel_Jn.x) annotation(
    Line(points = {{-78, 0}, {-70, 0}, {-70, 50}, {-62, 50}}, color = {0, 0, 127}));
  connect(x_ramp.y, bessel_Yn.x) annotation(
    Line(points = {{-78, 0}, {-70, 0}, {-70, 30}, {-62, 30}}, color = {0, 0, 127}));
  connect(x_ramp.y, bessel_In.x) annotation(
    Line(points = {{-78, 0}, {-70, 0}, {-70, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(x_ramp.y, bessel_Kn.x) annotation(
    Line(points = {{-78, 0}, {-70, 0}, {-70, -50}, {-62, -50}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
  Documentation(info = "<html><head></head><body><div><br></div><div>U<sub>nm</sub>(r,phi,z) = R<sub>n</sub>(kr)&nbsp;Z(kz) e<sup>i*m*phi</sup> .</div><div><br></div><div>R<sub>n</sub>(kr) = A<sub>n</sub>&nbsp;J<sub>n</sub>(kr) + B<sub>n</sub>&nbsp;Y<sub>n</sub>(kr) .</div><div><br></div>R<sub>n</sub>(x<sub>ni</sub>) = A<sub>n</sub>&nbsp;J<sub>n</sub>(x<sub>ni</sub>) + B<sub>n</sub>&nbsp;Y<sub>n</sub>(x<sub>ni</sub>) = 0 &nbsp;--&gt; &nbsp;R<sub>n</sub>(x) = Y<sub>n</sub>(x<sub>n0</sub>) J<sub>n</sub>(x) - J<sub>n</sub>(x<sub>n0</sub>) Y<sub>n</sub>(x) ...<div>R<sub>n</sub>(x<sub>nj</sub>) = Y<sub>n</sub>(x<sub>n0</sub>) J<sub>n</sub>(x<sub>nj</sub>) - J<sub>n</sub>(x<sub>n0</sub>) Y<sub>n</sub>(x<sub>nj</sub>) = 0 .<div><div><div><br></div><div>x<sub>nj</sub>&nbsp;- x<sub>n0</sub> = k<sub>j</sub>&nbsp;(b&nbsp;- a) ; or rather, x<sub>n0</sub> (x<sub>nj</sub>/x<sub>n0</sub> - 1) = k<sub>j</sub>&nbsp;a&nbsp;(b/a&nbsp;- 1) .</div><div><br></div><div>So for each mode (n,j), x<sub>n0</sub> needs to be adjusted until x<sub>nj</sub>/x<sub>n0</sub> = b/a&nbsp;; then k<sub>j</sub> = x<sub>n0</sub>/a&nbsp;= x<sub>nj</sub>/b&nbsp;.</div></div></div></div><br><div>R<sub>n</sub>(kr) = C<sub>n</sub>&nbsp;I<sub>n</sub>(kr) + D<sub>n</sub>&nbsp;K<sub>n</sub>(kr) .</div><div><br></div>R<sub>n</sub>(x<sub>n0</sub>) = C<sub>n</sub>&nbsp;I<sub>n</sub>(x<sub>n0</sub>) + D<sub>n</sub>&nbsp;K<sub>n</sub>(x<sub>n0</sub>) = 0 &nbsp;--&gt; &nbsp;R<sub>n</sub>(x) = K<sub>n</sub>(x<sub>n0</sub>) I<sub>n</sub>(x) - I<sub>n</sub>(x<sub>n0</sub>) K<sub>n</sub>(x) .</body></html>"));
end CoaxialDirichlet;