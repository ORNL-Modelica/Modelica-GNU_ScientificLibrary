within GNU_ScientificLibrary.Functions.specfunc;

function erf "Error function"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_erf(x) annotation(Library = "libgsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Error function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>erf</i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end erf;
