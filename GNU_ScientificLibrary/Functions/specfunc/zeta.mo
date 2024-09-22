within GNU_ScientificLibrary.Functions.specfunc;

function zeta "Riemann zeta function function, zeta(s)"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_zeta(x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Riemann zeta function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>zeta</i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end zeta;