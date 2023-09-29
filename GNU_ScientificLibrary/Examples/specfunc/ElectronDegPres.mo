within GNU_ScientificLibrary.Examples.specfunc;

model ElectronDegPres "Electron Degeneracy Pressure"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  import const = Modelica.Constants;
  final constant Real m_e = 9.10938e-31 "mass of the electron in kg";
  final constant Real k_dens = 2 * (2*const.pi*m_e*const.k/const.h^2)^1.5;
  final constant Real k_pres = k_dens * const.k;
  Modelica.Blocks.Math.Add diff(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {50, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs annotation(
    Placement(visible = true, transformation(origin = {90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_Fhalf fermiDirac_Fhalf annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.FermiDirac_F3half fermiDirac_F3half annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Fhalf_ramp(duration = 10000, height = 10000, offset = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.NumericalInversions.FermiDirac_InvertFhalf mu_from_Fhalf annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Temp_K(k = 300)  annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain to_density(k = k_dens)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt sqrt annotation(
    Placement(visible = true, transformation(origin = {-50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product T32 annotation(
    Placement(visible = true, transformation(origin = {-10, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product T52 annotation(
    Placement(visible = true, transformation(origin = {30, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain to_pres(k = k_pres)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product ndensity annotation(
    Placement(visible = true, transformation(origin = {30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product pressure annotation(
    Placement(visible = true, transformation(origin = {100, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Log10 log10_pres annotation(
    Placement(visible = true, transformation(origin = {130, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Log10 log10_ndens annotation(
    Placement(visible = true, transformation(origin = {60, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(diff.y, abs.u) annotation(
    Line(points = {{61, 56}, {77, 56}}, color = {0, 0, 127}));
  connect(Fhalf_ramp.y, mu_from_Fhalf.y) annotation(
    Line(points = {{-69, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(Fhalf_ramp.y, diff.u1) annotation(
    Line(points = {{-69, 0}, {-50, 0}, {-50, 62}, {38, 62}}, color = {0, 0, 127}));
  connect(mu_from_Fhalf.x, fermiDirac_Fhalf.x) annotation(
    Line(points = {{-18, 0}, {-10, 0}, {-10, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(mu_from_Fhalf.x, fermiDirac_F3half.x) annotation(
    Line(points = {{-18, 0}, {-2, 0}}, color = {0, 0, 127}));
  connect(fermiDirac_Fhalf.y, diff.u2) annotation(
    Line(points = {{22, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(Fhalf_ramp.y, to_density.u) annotation(
    Line(points = {{-69, 0}, {-50, 0}, {-50, -30}, {-42, -30}}, color = {0, 0, 127}));
  connect(Temp_K.y, sqrt.u) annotation(
    Line(points = {{-79, -60}, {-71, -60}, {-71, -80}, {-63, -80}}, color = {0, 0, 127}));
  connect(sqrt.y, T32.u2) annotation(
    Line(points = {{-39, -80}, {-31, -80}, {-31, -72}, {-23, -72}}, color = {0, 0, 127}));
  connect(Temp_K.y, T32.u1) annotation(
    Line(points = {{-79, -60}, {-23, -60}}, color = {0, 0, 127}));
  connect(fermiDirac_F3half.y, to_pres.u) annotation(
    Line(points = {{22, 0}, {38, 0}}, color = {0, 0, 127}));
  connect(T32.y, T52.u1) annotation(
    Line(points = {{1, -66}, {17, -66}}, color = {0, 0, 127}));
  connect(Temp_K.y, T52.u2) annotation(
    Line(points = {{-79, -60}, {-71, -60}, {-71, -100}, {9, -100}, {9, -78}, {17, -78}}, color = {0, 0, 127}));
  connect(to_density.y, ndensity.u1) annotation(
    Line(points = {{-18, -30}, {18, -30}}, color = {0, 0, 127}));
  connect(T32.y, ndensity.u2) annotation(
    Line(points = {{1, -66}, {10, -66}, {10, -42}, {18, -42}}, color = {0, 0, 127}));
  connect(to_pres.y, pressure.u1) annotation(
    Line(points = {{62, 0}, {88, 0}}, color = {0, 0, 127}));
  connect(pressure.y, log10_pres.u) annotation(
    Line(points = {{111, -6}, {117, -6}}, color = {0, 0, 127}));
  connect(ndensity.y, log10_ndens.u) annotation(
    Line(points = {{42, -36}, {48, -36}}, color = {0, 0, 127}));
  connect(T52.y, pressure.u2) annotation(
    Line(points = {{42, -72}, {80, -72}, {80, -12}, {88, -12}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-06, Interval = 1),
  Documentation(info = "<html><head></head><body>Model for calculating the contribution to the equation of state (EoS) which arises from the main exchange interaction (degeneracy) between electrons in a plasma (or conduction electrons in a metal). At extremely high densities (white dwarf), this becomes the dominant interaction.<div><br><div>For the complete EoS, electromagnetic interactions (direct and exchange) among the electrons and ions must also be taken into account (see, e.g., §§ 78-80 in Landau and Lifshitz, Statistical Physics Part 1 (3rd edition), 1980).</div></div><div><br></div><div>Note the use of the 'FermiDirac_InvertFhalf' block for numerically determining x from F<sub>1/2</sub>(x)-y=0, essentially obtaining the chemical potential, mu=x*k*T, from the number density (~ F<sub>1/2</sub>(x)*T<sup>3/2</sup>) and temperature (T). x is then used to find the pressure from F<sub>3/2</sub>(x) and T (p ~ F<sub>3/2</sub>(x)*T<sup>5/2</sup>).</div><div><br></div><div>A parametric plot of 'log10_pres.y' (in log10 Pa) vs 'log10_ndens.y' (in log10 m<sup>-3</sup>) should impress upon one the phenomenal pressures exerted by fermions' inability to occupy the same quantum states, and the tremendous forces (internal or external) at play for these to be counteracted in materials (EM in solids, gravity in stars). At lower densities, this plot reveals a slope of about 1 (or P ~ n; Maxwell-Boltzmann gas), while at higher densities, the slope tends toward 5/3 (P ~ n<sup>5/3</sup>; degenerate gas; EoS becomes stiffer). If one considers Cu, with 8.43*10<sup>28</sup>&nbsp;conduction-e/m<sup>3</sup>, at T=300K, this is well in the degenerate region (x=270), with P = 38&nbsp;GPa&nbsp;! (It is not encoded herein, but at extremely high densities, mu &gt; m<sub>e</sub>*c<sup>2</sup>, relativistic effects become important and the EoS should turn over to P ~ n<sup>4/3</sup><font size=\"2\">.)</font></div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/logP_vs_logn.png\"></div></body></html>"),
  Diagram(coordinateSystem(extent = {{-100, 80}, {140, -100}})));
end ElectronDegPres;