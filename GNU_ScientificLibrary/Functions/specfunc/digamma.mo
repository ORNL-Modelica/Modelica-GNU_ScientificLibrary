within GNU_ScientificLibrary.Functions.specfunc;

function digamma "Digamma function, psi(x)"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_psi(x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Digamma function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>psi</i></font><i style=\"font-family: 'Times New Roman';\">(x) = G'(x)/G(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end digamma;