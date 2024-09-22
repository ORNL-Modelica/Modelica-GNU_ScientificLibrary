within GNU_ScientificLibrary.Functions.specfunc;
function debye_D3
  "Debye function of order 3"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_debye_3(x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Debye function of order 3,&nbsp;<i>D<sub>3</sub>(x)</i>.</span></p>
</body></html>"));
end debye_D3;