within GNU_ScientificLibrary.Blocks.integration;

block Lobatto_quadrature
  extends Icons.Block;
  parameter Integer n_par = 1 "Number of parameters in integrand";
  parameter Real rel_err = 1.e-7;
  //
  function func
    extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
    input Integer n_p;
    input Real p[n_p];
  algorithm
    y := GNU_ScientificLibrary.Functions.integration.integrand(u,n_p,p);
  end func;
  //
  Modelica.Blocks.Interfaces.RealInput a annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput b annotation(
    Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput par[n_par] annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  y = Modelica.Math.Nonlinear.quadratureLobatto(function func(n_p = n_par, p = par), a, b, rel_err);
  annotation(
    Documentation(info = "<html><head></head><body><div>Block for accessing Modelica's Lobatto integration routine for the externally defined integrand.</div><div><br></div><div>IMPORTANT!!!: The integrand-setup model 'CreateIntegrand' (or a duplicate) must be run before using GSL integration routines or blocks within a larger Modelica model. (Alternatively, one could edit integrand.c directly and then compile \"by hand\" in a command window:<div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -fPIC -c integrand.c integration_mi.c</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>gcc -shared integration.o integration_mi.o -o libgsl_integration_MI.so &nbsp;[.dll for windows])</div></div></body></html>"),
    Icon(graphics = {Text(extent = {{-60, 40}, {60, -40}}, textString = "Lob")}));
end Lobatto_quadrature;