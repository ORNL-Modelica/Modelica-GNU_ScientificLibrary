within GNU_ScientificLibrary.Blocks.specfunc.NumericalInversions;

block FermiDirac_InvertFhalf
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_yx;
  Real xmin, xmax;

  function FhalfMinusF
    extends Modelica.Math.Nonlinear.Interfaces.partialScalarFunction;
    input Real F;
  algorithm
    y := GNU_ScientificLibrary.Functions.specfunc.fermidirac_Fhalf(u) - F;
  end FhalfMinusF;

equation
  if y < 1.0 then   // Maxwell-Boltzmann asymp. expansion
    xmin = log(y);
    xmax = xmin + 0.4;
  elseif y > 3.0 then   // degenerate asymp. expansion
    xmax = (0.75*y*sqrt(Modelica.Constants.pi))^0.6666666666667;
    xmin = xmax - 0.4;
  else
    xmin = log(y);
    xmax = (0.75*y*sqrt(Modelica.Constants.pi))^0.6666666666667;
  end if;
  x = Modelica.Math.Nonlinear.solveOneNonlinearEquation(function FhalfMinusF(F=y), xmin, xmax);
  annotation(
    Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, textString = "F_1/2^-1(y)")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>Numerical inversion of F<sub>1/2</sub>(x)=y: &nbsp;x = F<sub>1/2</sub><sup>-1</sup>(y).</body></html>"));
end FermiDirac_InvertFhalf;
