within GNU_ScientificLibrary.Functions.specfunc;
function fermidirac_Fmhalf
  "Complete Fermi-Dirac integral of order -1/2"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_fermi_dirac_mhalf(x) annotation(Library="libgsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">These routines compute the Complete Fermi-Dirac integral of -1/2 order,&nbsp;<i>F_-1/2(x)</i>.</span></p>
</body></html>"));
end fermidirac_Fmhalf;