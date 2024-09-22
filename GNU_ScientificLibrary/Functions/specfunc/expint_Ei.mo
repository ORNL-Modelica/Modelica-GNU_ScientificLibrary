within GNU_ScientificLibrary.Functions.specfunc;

function expint_Ei "Exponential Integral Ei(x)"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_expint_Ei(x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Exponential Integral, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>E<font size=\"2\">i</font></i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end expint_Ei;