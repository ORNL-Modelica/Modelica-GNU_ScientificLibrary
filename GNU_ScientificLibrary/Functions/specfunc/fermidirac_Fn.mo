within GNU_ScientificLibrary.Functions.specfunc;
function fermidirac_Fn
  "Complete Fermi-Dirac integral of order n"
  extends Modelica.Icons.Function;

input Integer n;
input Real x;
output Real y;

external "C" y=gsl_sf_fermi_dirac_int(n,x) annotation(Library="gsl");
  annotation (Documentation(info="<html>
<p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the Complete Fermi-Dirac integral of integer-n order,&nbsp;<i>F_n(x)</i>.</span></p>
</html>"));
end fermidirac_Fn;
