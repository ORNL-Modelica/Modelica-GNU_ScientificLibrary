within GNU_ScientificLibrary.Functions.specfunc;
function debye_D1
  "Debye function of order 1"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_debye_1(x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Debye function of order 1,&nbsp;<i>D<sub>1</sub>(x)</i>.</span></p>
</body></html>"));
end debye_D1;