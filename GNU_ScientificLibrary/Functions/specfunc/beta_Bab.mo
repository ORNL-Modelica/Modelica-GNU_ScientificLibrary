within GNU_ScientificLibrary.Functions.specfunc;

function beta_Bab "Beta function, B(a,b)"
  extends Modelica.Icons.Function;
  input Real a,x;
  output Real y;

  external "C" y = gsl_sf_beta(a,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Beta function, </span><span style=\"background-color: rgb(255, 255, 255);\"><i style=\"font-family: 'Times New Roman';\">Beta(a,x) = Gamma(a)Gamma(x)/Gamma(a+x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end beta_Bab;