within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block Hermite_psi_n_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Integer n = 0;
  parameter Real Norm = 1;
  parameter Real x1 = 0, x2 = 1;
  parameter Real dtdx = 1.0/(x2-x1);
  Real xsq, p(start = 1) "psi value at x1";
  Real dp(start = 0) "dpsi/dx value at x1";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  xsq = x*x;
  dtdx*der(p) = dp;
  dtdx*der(dp) = (xsq - 2*n - 1)*p;
  y = p*Norm;
  dydx = dp*Norm;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) psi(n,x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equation for psi<sub>n</sub>(x): d<sup>2</sup>p/dx<sup>2</sup>&nbsp;+ (2n + 1 - x<sup>2</sup>) p = 0 .<div><br><div>Domain: -infinity &lt; x &lt; infinity.</div></div></body></html>"));
end Hermite_psi_n_DEs;