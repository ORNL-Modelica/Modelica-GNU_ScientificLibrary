within GNU_ScientificLibrary.Functions.specfunc;
function sph_bessel_yl
  "Spherical Bessel function of the 1st kind (irregular) of order l"
  extends Modelica.Icons.Function;

input Integer l;
input Real x;
output Real y;

external "C" y=gsl_sf_bessel_yl(l,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the irregular spherical Bessel function of order <i>l</i>, y<i>_l(x)</i>.</span></p>
</body></html>"));
end sph_bessel_yl;