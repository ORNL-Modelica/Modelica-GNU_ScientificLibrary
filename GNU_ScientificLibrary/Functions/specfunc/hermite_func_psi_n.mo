within GNU_ScientificLibrary.Functions.specfunc;
function hermite_func_psi_n
  "Hermite function of order n"
  extends Modelica.Icons.Function;

input Integer n;
input Real x;
output Real y;

external "C" y=gsl_sf_hermite_func(n,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Hermite function of order&nbsp;<i>n</i>,&nbsp;<i>psi_n(x)</i>.</span></p>
</body></html>"));
end hermite_func_psi_n;