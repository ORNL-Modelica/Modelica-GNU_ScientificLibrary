within GNU_ScientificLibrary.Functions.specfunc;
function debye_D2
  "Debye function of order 2"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_debye_2(x) annotation(Library="libgsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Debye function of order 2,&nbsp;<i>D<sub>2</sub>(x)</i>.</span></p>
</body></html>"));
end debye_D2;