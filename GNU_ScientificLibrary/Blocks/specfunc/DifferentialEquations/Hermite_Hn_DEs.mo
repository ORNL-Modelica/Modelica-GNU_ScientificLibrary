within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block Hermite_Hn_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Integer n = 0;
  parameter Real Norm = 1;
  parameter Real x1 = 0, x2 = 1;
  parameter Real dtdx = 1.0/(x2-x1);
  Real h(start = 1) "h value at x1";
  Real dh(start = 0) "dh/dx value at x1";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  dtdx*der(h) = dh;
  dtdx*der(dh) = 2*x*dh - 2*n*h;
  y = h*Norm;
  dydx = dh*Norm;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) H(n,x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equation for H<sub>n</sub>(x): d<sup>2</sup>h/dx<sup>2</sup>&nbsp;- 2x dh/dx + 2n&nbsp;h = 0 .<div><br><div>Domain: -infinity &lt; x &lt; infinity.</div></div></body></html>"));
end Hermite_Hn_DEs;