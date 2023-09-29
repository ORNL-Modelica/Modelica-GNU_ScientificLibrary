within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block Bessel_Jnu_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Real nu = 0;
  parameter Real Norm = 1;
  parameter Real x1 = 0, x2 = 1;
  parameter Real dtdx = 1.0/(x2-x1);
  Real xsq, w(start = 1) "w value at x1";
  Real dw(start = 0) "dw/dx value at x1";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  xsq = x*x;
  dtdx*der(w) = dw;
  dtdx*xsq*der(dw) = -x*dw - (xsq - nu*nu)*w;
  y = w*Norm;
  dydx = dw*Norm;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) J_nu(x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equation for J<sub>nu</sub>(x) and Y<sub>nu</sub>(x): x<sup>2</sup> d<sup>2</sup>w/dx<sup>2</sup> + x dw/dx + (x<sup>2</sup> - nu<sup>2</sup>) w = 0 .<div><br><div>Domain: 0 &lt;= x &lt; infinity.</div></div></body></html>"));
end Bessel_Jnu_DEs;