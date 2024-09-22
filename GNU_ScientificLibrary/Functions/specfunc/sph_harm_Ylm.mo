within GNU_ScientificLibrary.Functions.specfunc;
function sph_harm_Ylm
  "Normalized Spherical Harmonic of order l,m"
  extends Modelica.Icons.Function;

input Integer l,m;
input Real x;
output Real y;

external "C" y=gsl_sf_legendre_sphPlm(l,m,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the normalized spherical harmonic, Y<sub>lm</sub>(x), where x=cos(theta) and to complete the function a factor of (-1)<sup>m</sup> e<sup>i*m*phi&nbsp;</sup>is needed.</span></p>
</body></html>"));
end sph_harm_Ylm;