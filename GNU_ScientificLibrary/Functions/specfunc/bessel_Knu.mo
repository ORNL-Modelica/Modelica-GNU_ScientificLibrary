within GNU_ScientificLibrary.Functions.specfunc;
function bessel_Knu
  "Irregular modified Bessel function of order nu"
  extends Modelica.Icons.Function;

input Real nu;
input Real x;
output Real y;

external "C" y=gsl_sf_bessel_Knu(nu,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the irregular modified Bessel function of (possibly fractional) order&nbsp;<i>nu</i>,&nbsp;<i>K_nu(x)</i>.</span></p>
</body></html>"));
end bessel_Knu;