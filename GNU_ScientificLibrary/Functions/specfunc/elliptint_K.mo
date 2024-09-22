within GNU_ScientificLibrary.Functions.specfunc;

function elliptint_K "Complete Elliptic Integral K(k)"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_ellint_Kcomp(x,0) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the complete Elliptic Integral, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>K</i></font><i style=\"font-family: 'Times New Roman';\">(k)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end elliptint_K;