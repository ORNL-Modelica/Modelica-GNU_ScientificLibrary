within GNU_ScientificLibrary.Functions.specfunc;
function debye_D4
  "Debye function of order 4"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_debye_4(x) annotation(Library="libgsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Debye function of order 4,&nbsp;<i>D<sub>4</sub>(x)</i>.</span></p>
</body></html>"));
end debye_D4;