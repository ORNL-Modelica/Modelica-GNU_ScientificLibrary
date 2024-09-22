within GNU_ScientificLibrary.Functions.specfunc;

function laguerre_Ln "Laguerre functions, L_n^a(x)"
  extends Modelica.Icons.Function;
  input Integer n;
  input Real a,x;
  output Real y;

  external "C" y = gsl_sf_laguerre_n(n,a,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Laguerre functions, </span><span style=\"background-color: rgb(255, 255, 255);\"><i style=\"font-family: 'Times New Roman';\">L<sub>n</sub><sup>a</sup>(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end laguerre_Ln;