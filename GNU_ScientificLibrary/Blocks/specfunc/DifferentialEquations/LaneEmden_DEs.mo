within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block LaneEmden_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Real n = 3;
  parameter Real Norm = 1;
  parameter Real x1 = 1.e-3, x2 = 10;
  parameter Real dtdx = 1.0/(x2-x1);
  Real xsq, theta(start = 1) "theta value at x1";
  Real phi(start = 0) "d_theta/d_x value at x1";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  xsq = if x > 0 then x*x else 1.e-6;
  dtdx*der(theta) = phi / xsq;
  dtdx*der(phi) = -theta^n * xsq;
//  relDens = theta^n;
//  relPres = relDens * theta;
  y = theta*Norm;
  dydx = phi*Norm/xsq;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) theta(n,x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equations for the Lane-Emden functions.</body></html>"));
end LaneEmden_DEs;