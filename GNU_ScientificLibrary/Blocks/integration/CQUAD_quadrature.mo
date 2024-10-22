within GNU_ScientificLibrary.Blocks.integration;

block CQUAD_quadrature
  // contact: tommy.burch@physik.uni-r.de
  extends Icons.Block;
  parameter Integer n_par = 1 "Number of parameters in integrand";
  parameter Integer n_int = 100;
  parameter Real rel_err = 1.e-7;
  Real err;
  Modelica.Blocks.Interfaces.RealInput a annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput b annotation(
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput par[n_par] annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  (y, err) = Functions.integration.cquad(n_par, par, a, b, rel_err, n_int);
  annotation(
    Documentation(info = "<html><head></head><body><div>Block for accessing the external GSL CQUAD doubly-adaptive integration routine, which can handle most types of singularities in the region of integration.</div><div><div><br></div></div><div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand' (or a duplicate) must be run before using GSL integration routines or blocks within a larger Modelica model. (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:<div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div></div><div><br></div></body></html>"),
    Icon(graphics = {Text(extent = {{-60, 40}, {60, -40}}, textString = "CQUAD")}));
end CQUAD_quadrature;