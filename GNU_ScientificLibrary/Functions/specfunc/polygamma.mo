within GNU_ScientificLibrary.Functions.specfunc;

function polygamma "Polygamma function, psi_n(x)"
  extends Modelica.Icons.Function;
  input Integer n;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_psi_n(n,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Polygamma function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>psi_n</i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end polygamma;