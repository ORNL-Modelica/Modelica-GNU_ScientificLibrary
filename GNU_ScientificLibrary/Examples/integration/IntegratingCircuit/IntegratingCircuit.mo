within GNU_ScientificLibrary.Examples.integration.IntegratingCircuit;

model IntegratingCircuit "Integrating circuit vs GSL integration"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  parameter Integer n_par = 3;
  //
  record CircuitParams
    extends Modelica.Icons.Record;
    parameter Real R = 1 "Resistance in Ohm";
    parameter Real C = 2 "Capacitance in F";
    final parameter Real t_RC = R*C "Time constant (RC) in s";
  end CircuitParams;
  //
  Blocks.integration.Integrand integrand(n_par = n_par)  annotation(
    Placement(transformation(origin = {-30, 10}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited opAmp annotation(
    Placement(transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = circuitParams.R)  annotation(
    Placement(transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = circuitParams.C, v(fixed = true))  annotation(
    Placement(transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(
    Placement(transformation(origin = {10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(
    Placement(transformation(origin = {70, -10}, extent = {{10, 10}, {-10, -10}}, rotation = -180)));
  Blocks.integration.QAG_quadrature qAG_quad(n_par = n_par)  annotation(
    Placement(transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp x_ramp(height = 5, duration = 5)  annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant params[n_par](k = {1, 1, 1})  annotation(
    Placement(transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant a_const(k = x_ramp.offset)  annotation(
    Placement(transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add diff(k2 = -1)  annotation(
    Placement(transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}})));
  CircuitParams circuitParams annotation(
    Placement(transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain RCgain[n_par](k = {1/(circuitParams.t_RC), 1, 1})  annotation(
    Placement(transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(signalVoltage.p, resistor.p) annotation(
    Line(points = {{10, 20}, {10, 30}, {20, 30}}, color = {0, 0, 255}));
  connect(resistor.n, opAmp.in_n) annotation(
    Line(points = {{40, 30}, {50, 30}, {50, 16}, {60, 16}}, color = {0, 0, 255}));
  connect(resistor.n, capacitor.p) annotation(
    Line(points = {{40, 30}, {50, 30}, {50, 40}, {60, 40}}, color = {0, 0, 255}));
  connect(integrand.f, signalVoltage.v) annotation(
    Line(points = {{-19, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(x_ramp.y, integrand.x) annotation(
    Line(points = {{-58, 10}, {-42, 10}}, color = {0, 0, 127}));
  connect(x_ramp.y, qAG_quad.b) annotation(
    Line(points = {{-58, 10}, {-54, 10}, {-54, -56}, {-2, -56}}, color = {0, 0, 127}));
  connect(params.y, integrand.par) annotation(
    Line(points = {{-59, -30}, {-50, -30}, {-50, 4}, {-42, 4}}, color = {0, 0, 127}, thickness = 0.5));
  connect(a_const.y, qAG_quad.a) annotation(
    Line(points = {{-59, -70}, {-30, -70}, {-30, -50}, {-2, -50}}, color = {0, 0, 127}));
  connect(signalVoltage.n, ground.p) annotation(
    Line(points = {{10, 0}, {10, -10}, {30, -10}}, color = {0, 0, 255}));
  connect(capacitor.n, opAmp.out) annotation(
    Line(points = {{80, 40}, {90, 40}, {90, 10}, {80, 10}}, color = {0, 0, 255}));
  connect(opAmp.out, voltageSensor.n) annotation(
    Line(points = {{80, 10}, {90, 10}, {90, -10}, {80, -10}}, color = {0, 0, 255}));
  connect(voltageSensor.p, ground.p) annotation(
    Line(points = {{60, -10}, {30, -10}}, color = {0, 0, 255}));
  connect(qAG_quad.y, diff.u2) annotation(
    Line(points = {{22, -50}, {50, -50}, {50, -56}, {78, -56}}, color = {0, 0, 127}));
  connect(voltageSensor.v, diff.u1) annotation(
    Line(points = {{70, -21}, {70, -44}, {78, -44}}, color = {0, 0, 127}));
  connect(opAmp.in_p, ground.p) annotation(
    Line(points = {{60, 4}, {50, 4}, {50, -10}, {30, -10}}, color = {0, 0, 255}));
  connect(RCgain.y, qAG_quad.par) annotation(
    Line(points = {{-18, -30}, {-10, -30}, {-10, -44}, {-2, -44}}, color = {0, 0, 127}, thickness = 0.5));
  connect(params.y, RCgain.u) annotation(
    Line(points = {{-58, -30}, {-42, -30}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    preferredView = "diagram",
    Documentation(info = "<html><head></head><body>Integrator circuit vs QAG integration routine.<div><br></div><div><span class=\"Apple-tab-span\" style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px; white-space: pre;\">	</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">input voltage: &nbsp;V</span><sub style=\"font-family: 'DejaVu Sans Mono';\">0</sub><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">&nbsp;(1 - e</span><sup style=\"font-family: 'DejaVu Sans Mono';\">-t/τ1</sup><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">) e</span><sup style=\"font-family: 'DejaVu Sans Mono';\">-t/τ2</sup><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">&nbsp;</span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The recalculation of the integral via QAG for each time t is a bit of overkill, but the agreement with the output voltage from the integrator circuit is thereby made clear. The slight difference is due to a combination of the finite timestep for the circuit simulation, the op-amp's behavior, and the relative error in the QAG integrator.</span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">IMPORTANT!!!: The integrand-setup model 'CircuitIntegrand' (or a duplicate) must be run before using GSL integration routines within a larger Modelica model (like this one). (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:</span><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><img src=\"modelica://GNU_ScientificLibrary/Examples/integration/IntegV_vs_t.png\" style=\"font-family: -webkit-standard;\"></div></body></html>"),
  Diagram(coordinateSystem(extent = {{-80, 60}, {100, -80}})),
  experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end IntegratingCircuit;