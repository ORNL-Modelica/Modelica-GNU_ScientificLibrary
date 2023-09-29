within GNU_ScientificLibrary.Examples.specfunc;

model FermiDiracIntegrals_Complete "Complete Fermi-Dirac Integrals"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Ramp ramp(duration = 500, height = 500, offset = -10) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_Fhalf fermiDirac_Fhalf annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_F3half fermiDirac_F3half annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_Fn fermiDirac_F0(l = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_Fn fermiDirac_F1(l = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.AsymptoticForms.FermiDirac_FnuAsymp fermiDirac_FnuAsymp(nu = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add diff(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {30, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs_diff annotation(
    Placement(visible = true, transformation(origin = {70, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fermiDirac_FnuAsymp.y, diff.u1) annotation(
    Line(points = {{2, 70}, {18, 70}}, color = {0, 0, 127}));
  connect(fermiDirac_Fhalf.y, diff.u2) annotation(
    Line(points = {{2, 30}, {10, 30}, {10, 58}, {18, 58}}, color = {0, 0, 127}));
  connect(diff.y, abs_diff.u) annotation(
    Line(points = {{42, 64}, {58, 64}}, color = {0, 0, 127}));
  connect(ramp.y, fermiDirac_Fhalf.x) annotation(
    Line(points = {{-58, 0}, {-40, 0}, {-40, 30}, {-22, 30}}, color = {0, 0, 127}));
  connect(ramp.y, fermiDirac_FnuAsymp.x) annotation(
    Line(points = {{-58, 0}, {-40, 0}, {-40, 70}, {-22, 70}}, color = {0, 0, 127}));
  connect(ramp.y, fermiDirac_F3half.x) annotation(
    Line(points = {{-58, 0}, {20, 0}, {20, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(ramp.y, fermiDirac_F0.x) annotation(
    Line(points = {{-58, 0}, {-40, 0}, {-40, -40}, {-22, -40}}, color = {0, 0, 127}));
  connect(ramp.y, fermiDirac_F1.x) annotation(
    Line(points = {{-58, 0}, {20, 0}, {20, -40}, {38, -40}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.25),
  Documentation(info = "<html><head></head><body>Example evaluation of complete Fermi-Dirac integrals, F<sub>nu</sub>(x), using GSL function blocks.<div><br></div><div>The F<sub>3/2</sub>(x) and F<sub>1/2</sub>(x) functions are related to the pressure and density, respectively, of an ensemble of non-relativistic fermions and can be used to determine part of the equation of state (EoS) of, say, conduction electrons in metals and plasmas (x = mu/k*T; see, e.g., §56 of Landau &amp; Lifshitz, Statistical Physics Part 1, 1980). A comparison of F<sub>1/2</sub>(x) with its asymptotic forms (x&lt;&lt;-1 and x&gt;&gt;1) is also provided.</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/Fhalf_vs_eta.png\"></div></body></html>"),
  Diagram(coordinateSystem(extent = {{-80, 80}, {80, -60}})));
end FermiDiracIntegrals_Complete;