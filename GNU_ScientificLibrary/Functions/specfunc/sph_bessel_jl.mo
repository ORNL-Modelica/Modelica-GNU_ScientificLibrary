within GNU_ScientificLibrary.Functions.specfunc;
function sph_bessel_jl
  "Spherical Bessel function of the 1st kind (regular) of order l"
  extends Modelica.Icons.Function;

input Integer l;
input Real x;
output Real y;

external "C" y=gsl_sf_bessel_jl(l,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the regular spherical Bessel function of order <i>l</i>, j<i>_l(x)</i>.</span></p>
</body></html>"));
end sph_bessel_jl;