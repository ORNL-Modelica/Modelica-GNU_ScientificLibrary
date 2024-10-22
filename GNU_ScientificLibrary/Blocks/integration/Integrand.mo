within GNU_ScientificLibrary.Blocks.integration;

block Integrand "Block for providing access to currently-defined external integrand"
  // contact: tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Icons.Block;
  parameter Integer n_par = 1;
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput f annotation(
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput par[n_par] annotation(
    Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}})));
algorithm
  f := GNU_ScientificLibrary.Functions.integration.integrand(x,n_par,par);
annotation(
    Icon(graphics = {Text(extent = {{-60, 60}, {60, -60}}, textString = "f(x)")}),
  Documentation(info = "<html><head></head><body><div>This block provides the currently-defined integrand, f(x):&nbsp;</div><div><br></div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /<sup>b</sup>&nbsp;<br><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>I = | f(x) dx&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /<sub>a</sub>&nbsp;</div><div><br></div><div>The integrand function is compiled externally beforehand (via 'CreateIntegrand' or a duplicate) so that it may be accessed by GSL integration routines.</div></body></html>"));
end Integrand;