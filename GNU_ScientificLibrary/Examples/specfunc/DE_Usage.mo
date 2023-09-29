within GNU_ScientificLibrary.Examples.specfunc;

model DE_Usage "Example Usage of DE Blocks"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Real xJ1 = 0.0001, xJ2 = 5, xJ3 = 1;
  parameter Real xY1 = -0.99999, xY2 = 0.99999;
  parameter Real xP1 = 0, xP2 = 5;
  Modelica.Blocks.Sources.Ramp Ylm_ramp(duration = 1, height = xY2 - xY1, offset = xY1, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Jnu_ramp(duration = 1, height = xJ2 - xJ1, offset = xJ1, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Bessel_Jnu_DEs bessel_J0_DEs(Norm = 1, dw(fixed = true, start = 0), nu = 0, w(fixed = true, start = 1), x1 = xJ1, x2 = xJ2)  annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.SphHarm_Ylm_DEs sphHarm_Y11_DEs(l = 1, m = 1, x1 = xY1, x2 = xY2)  annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Bessel_Jnu_DEs bessel_J1_DEs(dw(fixed = true, start = 1), nu = 1, w(fixed = true, start = 0), x1 = xJ1, x2 = xJ2)  annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp JYnu_ramp(duration = 1, height = xJ2 - xJ3, offset = xJ3, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Bessel_Jnu_DEs bessel_JY1_DEs(dw(fixed = true, start = 1), nu = 1, w(fixed = true, start = 0), x1 = xJ3, x2 = xJ2)  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Bessel_Jnu_DEs bessel_JY1_DEs1(dw(fixed = true, start = 1), nu = 1, w(fixed = true, start = 0), x1 = xJ3, x2 = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp JYnu_ramp1(duration = 1, height = 0.2 - xJ3, offset = xJ3, startTime = 0)  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp psi_n_ramp(duration = 1, height = xP2 - xP1, offset = xP1)  annotation(
    Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Hermite_psi_n_DEs hermite_psi_0_DEs(dp(start = 0), n = 0, p(start = 1), x1 = xP1, x2 = xP2)  annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.DifferentialEquations.Hermite_psi_n_DEs hermite_psi_1_DEs(dp(start = 1), n = 1, p(start = 0), x1 = xP1, x2 = xP2)  annotation(
    Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Ylm_ramp.y, sphHarm_Y11_DEs.x) annotation(
    Line(points = {{-39, -50}, {-22, -50}}, color = {0, 0, 127}));
  connect(JYnu_ramp.y, bessel_JY1_DEs.x) annotation(
    Line(points = {{-39, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(JYnu_ramp1.y, bessel_JY1_DEs1.x) annotation(
    Line(points = {{41, 0}, {57, 0}}, color = {0, 0, 127}));
  connect(Jnu_ramp.y, bessel_J1_DEs.x) annotation(
    Line(points = {{-39, 50}, {-20, 50}, {-20, 70}, {-2, 70}}, color = {0, 0, 127}));
  connect(psi_n_ramp.y, hermite_psi_0_DEs.x) annotation(
    Line(points = {{61, -50}, {70, -50}, {70, -40}, {78, -40}}, color = {0, 0, 127}));
  connect(psi_n_ramp.y, hermite_psi_1_DEs.x) annotation(
    Line(points = {{61, -50}, {70, -50}, {70, -70}, {78, -70}}, color = {0, 0, 127}));
  connect(Jnu_ramp.y, bessel_J0_DEs.x) annotation(
    Line(points = {{-38, 50}, {-20, 50}, {-20, 30}, {-2, 30}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
  Documentation(info = "<html><head></head><body>Example usage of DE blocks. Bessel functions (J<sub>0</sub>, J<sub>1</sub>, Y<sub>1</sub>), spherical harmonics (Y<sub>1,1</sub>), and Hermite functions appear here. In all these examples, time is used essentially as a parametrization: the ramp sources run from time=0 to 1, and it is their outputs (*.y) that are used as the independent variable (x) for the DEs. Alteration of the times and limits of these ramp sources will also require adjustment of the 'dtdx' parameters of the DE blocks (Delta t / Delta x).<div><br></div><div>For the Bessel functions, examples of generating solely the functions J<sub>0</sub>(x) and J<sub>1</sub>(x) are shown. This is achieved by choosing the order in the DE blocks and the appropriate boundary conditions near the origin. The third Bessel example generates a combination of J<sub>1</sub>(x) and Y<sub>1</sub>(x) functions since the zeroed starting point of the integration is away from the origin (x=1). Integrating this example back toward the origin (next example to the right) reveals the divergence of the Y<sub>1</sub>(x) function.</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/Bessel_JY1_from_DEs.png\"></div><div><br></div><div>The lower-left example is for the first non-polynomial spherical harmonic, Y<sub>1,1</sub>(x). Again, note the appropriate boundary conditions at x~-1 to achieve this.</div><div><br></div><div>The last two examples involve the lowest solutions to the DE for the quantum harmonic oscillator: psi<sub>0,1</sub>(x).</div><div><br></div><div>In all such examples, the resulting normalization will be different from that provided by the corresponding GSL functions. The overall normalizations here are controlled via initial values for the functions and their derivatives. Care must also be taken that enough steps are chosen to avoid discretization errors [e.g., slight deviations from expected behavior can be seen near the boundaries for Y<sub>1,1</sub>(x) and psi<sub>0</sub>(x)].</div></body></html>"),
  Diagram(coordinateSystem(extent = {{-60, 80}, {100, -80}})));
end DE_Usage;