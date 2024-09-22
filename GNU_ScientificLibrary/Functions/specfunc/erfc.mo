within GNU_ScientificLibrary.Functions.specfunc;

function erfc "Complementary Error function"
  extends Modelica.Icons.Function;
  input Real x;
  output Real y;

  external "C" y = gsl_sf_erfc(x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Complementary Error function, </span><span style=\"background-color: rgb(255, 255, 255);\"><font face=\"Symbol\"><i>erfc</i></font><i style=\"font-family: 'Times New Roman';\">(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end erfc;