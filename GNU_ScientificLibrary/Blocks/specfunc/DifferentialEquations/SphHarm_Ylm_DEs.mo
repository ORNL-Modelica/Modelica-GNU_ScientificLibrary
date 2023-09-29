within GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations;

block SphHarm_Ylm_DEs
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;
  parameter Integer l=0, m=0;
  parameter Real Norm = sqrt((2*l+1)/(4*Modelica.Constants.pi)*GNU_ScientificLibrary.Functions.specfunc.gamma(l-m+1)/GNU_ScientificLibrary.Functions.specfunc.gamma(l+m+1));
  parameter Real x1 = -0.99999, x2 = 0.99999;
  parameter Real dtdx = 1.0/(x2-x1);
  Real xsq, Plm(start = (-1)^l) "(-1)^l at x1~-1 for m=0, otherwise should be 0 there";
  Real dPlm(start = (-1)^(l + m + 1)) "magnitude needs adjustment for proper normalization";
  Modelica.Blocks.Interfaces.RealOutput dydx annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  Plm = if m == 0 then (-1)^l else 0;
equation
//  y=Functions.specfunc.sph_harm_Ylm(l, m, u);
  xsq = if abs(x) >= 1 then 0.999999 else x*x;
  dtdx*der(Plm) = dPlm;
  dtdx*(1 - xsq)*der(dPlm) = 2*x*dPlm - (l*(l + 1) - m*m/(1 - xsq))*Plm;
  y = Plm*Norm;
  dydx = dPlm*Norm;
  annotation(
    Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "O(x,d/dx) Y(l,m,x) = 0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Differential Equation for P<sub>l</sub><sup>m</sup>(x). Output contains normalization factor for Y<sub>lm</sub>(x), but without adjustment of initial dP<sub>l</sub><sup>m</sup>/dx magnitude, result still requires overall normalization.<div><br><div>Domain: |x| &lt; 1.</div></div></body></html>"));
end SphHarm_Ylm_DEs;