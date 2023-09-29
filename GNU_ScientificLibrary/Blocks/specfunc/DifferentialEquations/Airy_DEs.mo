within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block Airy_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Real nu = 0;
  parameter Real Norm = 1;
  parameter Real x1 = 0, x2 = 1;
  parameter Real dtdx = 1.0/(x2-x1);
  Real w(start = 1) "w value at x1";
  Real dw(start = -1) "dw/dx value at x1";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  dtdx*der(w) = dw;
  dtdx*der(dw) = x*w;
  y = w*Norm;
  dydx = dw*Norm;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) Ai(x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equation for Ai(x) and Bi(x): d<sup>2</sup>w/dx<sup>2</sup>&nbsp;- x w = 0 .<div><br><div>Domain: -infinity &lt; x &lt; infinity.</div></div></body></html>"));
end Airy_DEs;