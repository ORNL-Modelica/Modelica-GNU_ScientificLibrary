within GNU_ScientificLibrary.Functions.specfunc;
function dilog_Li2
  "Dilogarithm, Li_2(x)"
  extends Modelica.Icons.Function;

input Real x;
output Real y;

external "C" y=gsl_sf_dilog(x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the real-argument Dilogarithm,&nbsp;<i>Li<sub>2</sub>(x)</i>.</span></p>
</body></html>"));
end dilog_Li2;