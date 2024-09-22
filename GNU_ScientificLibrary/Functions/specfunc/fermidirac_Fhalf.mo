within GNU_ScientificLibrary.Functions.specfunc;
function fermidirac_Fhalf
  "Complete Fermi-Dirac integral of order 1/2"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_fermi_dirac_half(x) annotation(Library="gsl");
  annotation (Documentation(info="<html>
<p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the Complete Fermi-Dirac integral of 1/2 order,&nbsp;<i>F_1/2(x)</i>.</span></p>
</html>"));
end fermidirac_Fhalf;
