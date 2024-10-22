within GNU_ScientificLibrary.Examples.integration.DoubleFDIntegrals;

model DoubleFDIntegrals "Evaluation of some double FD integrals"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Integer n_par = 2;
  Modelica.Blocks.Sources.Ramp y_ramp(duration = 1, height = y_max.k- 1, offset = 1)  annotation(
    Placement(transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant m_const(k = 1)  annotation(
    Placement(transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2(n1 = 1, n2 = 1)  annotation(
    Placement(transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}})));
  Blocks.integration.Integrand integrand(n_par = n_par)  annotation(
    Placement(transformation(origin = {30, 34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex20(n1 = 1, n2 = 1)  annotation(
    Placement(transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant y_max(k = 10)  annotation(
    Placement(transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain invgamma(k = 1.0/Functions.specfunc.gamma(m_const.k))  annotation(
    Placement(transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}})));
  Blocks.integration.QAG_quadrature qAG_quad(n_par = n_par)  annotation(
    Placement(transformation(origin = {30, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Modelica.Blocks.Math.Gain msign(k = -1)  annotation(
    Placement(transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(y_ramp.y, multiplex2.u1[1]) annotation(
    Line(points = {{-39, 20}, {-30, 20}, {-30, -4}, {-22, -4}}, color = {0, 0, 127}));
  connect(multiplex20.y, integrand.par) annotation(
    Line(points = {{1, 40}, {18, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(y_max.y, multiplex20.u1[1]) annotation(
    Line(points = {{-38, 50}, {-30, 50}, {-30, 46}, {-22, 46}}, color = {0, 0, 127}));
  connect(m_const.y, multiplex20.u2[1]) annotation(
    Line(points = {{-38, -10}, {-34, -10}, {-34, 34}, {-22, 34}}, color = {0, 0, 127}));
  connect(qAG_quad.y, invgamma.u) annotation(
    Line(points = {{41, -10}, {58, -10}}, color = {0, 0, 127}));
  connect(y_max.y, msign.u) annotation(
    Line(points = {{-38, 50}, {-30, 50}, {-30, 70}, {-22, 70}}, color = {0, 0, 127}));
  connect(msign.y, qAG_quad.a) annotation(
    Line(points = {{2, 70}, {8, 70}, {8, -10}, {18, -10}}, color = {0, 0, 127}));
  connect(multiplex2.y, qAG_quad.par) annotation(
    Line(points = {{2, -10}, {4, -10}, {4, -16}, {18, -16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(y_ramp.y, qAG_quad.b) annotation(
    Line(points = {{-38, 20}, {12, 20}, {12, -4}, {18, -4}}, color = {0, 0, 127}));
  connect(y_ramp.y, integrand.x) annotation(
    Line(points = {{-38, 20}, {12, 20}, {12, 34}, {18, 34}}, color = {0, 0, 127}));
  connect(m_const.y, multiplex2.u2[1]) annotation(
    Line(points = {{-38, -10}, {-34, -10}, {-34, -16}, {-22, -16}}, color = {0, 0, 127}));
  annotation(
    preferredView = "diagram",
    Diagram(coordinateSystem(extent = {{-60, 80}, {80, -20}})),
  Documentation(info = "<html><head></head><body>Evaluation of double Fermi-Dirac integrals. e.g., ...&nbsp;<div><br><div>&nbsp; &nbsp; &nbsp; &nbsp; /<sup>y</sup>&nbsp;</div><div><span class=\"Apple-tab-span\" style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px; white-space: pre;\">	</span>|<span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">&nbsp;F</span><sub style=\"font-family: 'DejaVu Sans Mono';\">-1/2</sub><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">(x) F</span><sub style=\"font-family: 'DejaVu Sans Mono';\">-1/2</sub><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">(x) dx &nbsp;</span></div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp; /-∞&nbsp;</span></div><div><font face=\"DejaVu Sans Mono\"><br></font><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">or more generally ...&nbsp;</span></div><div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/<sup>y</sup>&nbsp;</div><div><span style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>[Γ(m)]<sup>-1</sup> |<font face=\"DejaVu Sans Mono\">&nbsp;(y-x)</font></span><sup style=\"font-family: 'DejaVu Sans Mono';\">m-1</sup><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">&nbsp;F</span><span style=\"font-family: 'DejaVu Sans Mono';\"><font size=\"2\"><sub>j</sub></font></span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">(x) F</span><sub style=\"font-family: 'DejaVu Sans Mono';\">k</sub><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">(x) dx = G<sub>m,jk</sub>(y) &nbsp;, where m&gt;0.&nbsp;</span></div></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>&nbsp; &nbsp; &nbsp; &nbsp; /</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">-∞&nbsp;</span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Such integrals arise in calculations of pairwise fermion interactions in condensed matter systems, e.g., when calculating the electron EM exchange energy (see, e.g., the 'specfunc.ElectronDegPres' example and&nbsp;</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">§ 80 in Landau and Lifshitz, Statistical Physics Part 1 (3rd edition), 1980</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">).</span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></span></div><div><font face=\"DejaVu Sans Mono\">The values of y and m can be adjusted via the integrand parameters during model runtime. The values of j and k, however, must be chosen before creating (compiling) the integrand (see 'DoubleFDIntegrand').</font></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><div><font face=\"DejaVu Sans Mono\">Note that here -y<sub>max</sub>&nbsp;is chosen instead of -∞ since for most such integrals, very little contribution arises from the x&lt;&lt;-1 region.</font></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><div><font face=\"DejaVu Sans Mono\">For values of m&lt;1, care must be taken with the choice of integration routine as a singularity at x=y will appear in the integrand.</font></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/Gmjk_vs_y.png\"></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end DoubleFDIntegrals;