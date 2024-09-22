within GNU_ScientificLibrary.Functions.specfunc;

function lambert_Wm1 "Lambert W_-1 function"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_lambert_Wm1(x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Lambert function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>W<sub>-1</sub></i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end lambert_Wm1;