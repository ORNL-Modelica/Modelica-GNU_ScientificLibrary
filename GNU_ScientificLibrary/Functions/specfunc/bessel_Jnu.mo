within GNU_ScientificLibrary.Functions.specfunc;
function bessel_Jnu
  "Bessel function of the 1st kind of order nu"
  extends Modelica.Icons.Function;

input Real nu;
input Real x;
output Real y;

external "C" y=gsl_sf_bessel_Jnu(nu,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the regular Bessel function of (possibly fractional) order&nbsp;<i>nu</i>,&nbsp;<i>J_nu(x)</i>.</span></p>
</body></html>"));
end bessel_Jnu;