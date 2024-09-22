within GNU_ScientificLibrary.Functions.specfunc;
function legendre_Pl
  "Legendre polynomial of order l"
  extends Modelica.Icons.Function;

input Integer l;
input Real x;
output Real y;

external "C" y=gsl_sf_legendre_Pl(l,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Legendre polynomial of order <i>l</i>,&nbsp;<i>P<sub>l</sub>(x)</i>.</span></p>
</body></html>"));
end legendre_Pl;