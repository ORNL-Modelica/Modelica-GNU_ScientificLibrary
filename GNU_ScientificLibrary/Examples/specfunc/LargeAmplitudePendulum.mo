within GNU_ScientificLibrary.Examples.specfunc;

model LargeAmplitudePendulum "Pendulum with pi/2 Amplitude and Period from Elliptic Integral"
  // example by tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false, animateWorld = false, enableAnimation = false)  annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = false,phi(fixed = true), w(fixed = true))  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(I_11 = bodyParams.I_cm, I_22 = bodyParams.I_cm, I_33 = bodyParams.I_cm,animation = false,m = bodyParams.m, r_CM = {bodyParams.L, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Sensors.RelativeAngles theta(guessAngle1(displayUnit = "rad") = 0, sequence = {3, 1, 3})  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  GNU_ScientificLibrary.Blocks.specfunc.ElliptInt_K elliptInt_K annotation(
    Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain half(k = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  record BodyParams
    extends Modelica.Icons.Record;
    parameter Real m=1 "kg, mass";
    parameter Real L=1 "m, pivot-to-CM distance";
    parameter Real I_cm=0.001 "kg m^2, moment of inertia about CM";
    final parameter Real I=I_cm+m*L*L "kg m^2, total I (don't change)";
    final parameter Real T0=2.0*Modelica.Constants.pi*sqrt(I/(m*L*Modelica.Constants.g_n)) "s, small-angle period (don't change)";
  end BodyParams;

  Modelica.Blocks.Sources.Constant const(k = 2.0*bodyParams.T0/Modelica.Constants.pi)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product period annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LargeAmplitudePendulum.BodyParams bodyParams annotation(
    Placement(transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add annotation(
    Placement(transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant halfpi(k = 0.5*Modelica.Constants.pi)  annotation(
    Placement(transformation(origin = {-100, 70}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(revolute.frame_b, body.frame_a) annotation(
    Line(points = {{-40, -10}, {-30, -10}, {-30, -40}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-80, -10}, {-60, -10}}));
  connect(theta.frame_a, revolute.frame_a) annotation(
    Line(points = {{-60, 20}, {-70, 20}, {-70, -10}, {-60, -10}}, color = {95, 95, 95}));
  connect(theta.frame_b, revolute.frame_b) annotation(
    Line(points = {{-40, 20}, {-30, 20}, {-30, -10}, {-40, -10}}));
  connect(half.y, abs1.u) annotation(
    Line(points = {{-18, 50}, {-12, 50}}, color = {0, 0, 127}));
  connect(abs1.y, sin.u) annotation(
    Line(points = {{12, 50}, {18, 50}}, color = {0, 0, 127}));
  connect(sin.y, elliptInt_K.x) annotation(
    Line(points = {{42, 50}, {48, 50}}, color = {0, 0, 127}));
  connect(elliptInt_K.y, period.u1) annotation(
    Line(points = {{72, 50}, {74, 50}, {74, 36}, {78, 36}}, color = {0, 0, 127}));
  connect(const.y, period.u2) annotation(
    Line(points = {{62, 10}, {70, 10}, {70, 24}, {78, 24}}, color = {0, 0, 127}));
  connect(add.y, half.u) annotation(
    Line(points = {{-48, 50}, {-42, 50}}, color = {0, 0, 127}));
  connect(theta.angles[3], add.u2) annotation(
    Line(points = {{-50, 32}, {-50, 34}, {-80, 34}, {-80, 44}, {-72, 44}}, color = {0, 0, 127}));
  connect(halfpi.y, add.u1) annotation(
    Line(points = {{-88, 70}, {-80, 70}, {-80, 56}, {-72, 56}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-6, Interval = 0.003),
  Diagram(coordinateSystem(extent = {{-120, 100}, {100, -60}})),
  Documentation(info = "<html><head></head><body>This example involves a pendulum with pi/2 (=theta<sub>0</sub>) amplitude. A mass (m,I<sub>cm</sub>) is suspended a distance L from a pivot. From the conservation of total (kinetic + potential) energy, one finds (parallel-axis theorem: I=I<sub>cm</sub>+mL<sup>2</sup>):<div><br></div><div>dtheta/dt = sqrt[(2mgL/I)(cos(theta) - cos(theta<sub>0</sub>))]&nbsp;</div><div><br></div><div>After differentiating and doing some algebra, one arrives at the following DE:<br><div><br></div><div>d<sup>2</sup>theta/dt<sup>2</sup> + (mgL/I) sin(theta) = 0&nbsp;</div><div><br></div><div>The period can be found by integrating the dt/dtheta expression above, performing a change of integration variable, and using a trig half-angle formula. The result is a complete elliptic integral, K(k):</div><div><br></div><div>T = 4 sqrt(I/mgL) K(sin(theta<sub>0</sub>/2))&nbsp;</div><div><br></div><div>Plotting the period, T, as a function of starting angle (assuming dtheta/dt=0 at theta<sub>0</sub>):</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/period_vs_theta0.png\"></div><div><br></div><div>Near theta<sub>0</sub>=0, one finds the solution (T<sub>0</sub>~2s) for the small-angle approximation: sin(theta) ~ theta.</div></div><div><br></div><div>The period of the swinging-body simulation is found to match the calculation of the period from the max angle:</div><div><img src=\"modelica://GNU_ScientificLibrary/Examples/specfunc/thetaT_vs_t.png\"></div><div>Keep in mind that this acts as a check for the former, not the latter.</div></body></html>"));
end LargeAmplitudePendulum;