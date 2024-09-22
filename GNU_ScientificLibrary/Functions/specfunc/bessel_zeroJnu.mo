within GNU_ScientificLibrary.Functions.specfunc;
function bessel_zeroJnu
  "Zeros of Bessel function of the 1st kind of order nu"
  extends Modelica.Icons.Function;

input Real nu;
input Integer s;
output Real x;

external "C" x=gsl_sf_bessel_zero_Jnu(nu,s) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the s<sup>th</sup>&nbsp;zero of the regular Bessel function of order&nbsp;<i>nu</i>,&nbsp;<i>J_nu(x)</i>.</span></p>
</body></html>"));
end bessel_zeroJnu;