within GNU_ScientificLibrary.Functions.specfunc;
function bessel_In
  "Modified bessel function of the 1st kind (regular modified cylindrical) of order n"
  extends Modelica.Icons.Function;

input Integer n;
input Real x;
output Real y;

external "C" y=gsl_sf_bessel_In(n,x) annotation(Library="gsl");
  annotation (Documentation(info="<html>
<p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the regular cylindrical Bessel function of order&nbsp;<i>n</i>,&nbsp;<i>I_n(x)</i>.</span></p>
</html>"));
end bessel_In;
