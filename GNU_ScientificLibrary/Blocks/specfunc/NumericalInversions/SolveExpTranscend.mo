within GNU_ScientificLibrary.Blocks.specfunc.NumericalInversions;

block SolveExpTranscend
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Icons.Block;
  parameter Real x_min=-1.0/Modelica.Constants.e;
  Real w_arg;
  Modelica.Blocks.Interfaces.RealInput a annotation(
    Placement(transformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput b annotation(
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput c annotation(
    Placement(transformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput x[2] annotation(
    Placement(transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.BooleanOutput bx[2] annotation(
    Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
equation
  w_arg = -b*c*exp(a*c);
  if w_arg < x_min then
    bx[1] = false; bx[2] = false;
    x[1] = 0; x[2] = 0;
  elseif w_arg >= 0 then
    bx[1] = true; bx[2] = false;
    x[1] = a - GNU_ScientificLibrary.Functions.specfunc.lambert_W0(w_arg)/c;
    x[2] = 0;
  else
    bx[1] = true; bx[2] = true;
    x[1] = a - GNU_ScientificLibrary.Functions.specfunc.lambert_W0(w_arg)/c;
    x[2] = a - GNU_ScientificLibrary.Functions.specfunc.lambert_Wm1(w_arg)/c;
  end if;
  annotation (Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = "x=a+be^(cx)")}),
  Documentation(info = "<html><head></head><body><div>This block solves an exponential-transendental equation of the form:</div><div><br></div><div><div>x = a + b e<sup>cx</sup></div><div><br></div><div>where b and c must be nonzero. The solution is found via the Lambert W functions:</div><div><br></div><div>x = a - W(-bc e<sup>ac</sup>) / c&nbsp;</div><div><br></div><div>where W(y) is a solution of: W(y) e<sup>W(y)</sup> = y .</div><div><br></div><div>If the argument of the W function is real and between -1/e and 0, then there are two real values: W<sub>0</sub>&nbsp;(&gt;-1) and W<sub>-1</sub>&nbsp;(&lt;-1).</div><div>If the argument is real and &gt;=0, then there is one real value: W<sub>0</sub>.</div></div><div><br></div><div>The boolean outputs bx[1] and bx[2] denote whether real solutions exist. If their values are \"true\", then the corresponding x values contain the solutions: x[1] from W<sub>0</sub> and x[2] from W<sub>-1</sub>.</div></body></html>"));
end SolveExpTranscend;