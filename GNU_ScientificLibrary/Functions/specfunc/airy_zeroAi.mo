within GNU_ScientificLibrary.Functions.specfunc;
function airy_zeroAi
  "Zeros of Airy function of the 1st kind"
  extends Modelica.Icons.Function;

input Integer s;
output Real x;

external "C" x=gsl_sf_airy_zero_Ai(s) annotation(Library="libgsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the s<sup>th</sup>&nbsp;zero of the Airy function,&nbsp;<i>Ai(x)</i>.</span></p>
</body></html>"));
end airy_zeroAi;
