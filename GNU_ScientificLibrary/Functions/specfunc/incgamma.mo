within GNU_ScientificLibrary.Functions.specfunc;

function incgamma "Incomplete Gamma function, G(a,x)"
  extends Modelica.Icons.Function;
  input Real a,x;
  output Real y;

  external "C" y = gsl_sf_gamma_inc(a,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the incomplete Gamma function, </span><span style=\"background-color: rgb(255, 255, 255);\"><i style=\"font-family: 'Times New Roman';\">Gamma(a,x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end incgamma;