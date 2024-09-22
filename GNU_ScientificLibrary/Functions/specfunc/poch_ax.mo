within GNU_ScientificLibrary.Functions.specfunc;

function poch_ax "Pochhammer symbol (a)_x"
  extends Modelica.Icons.Function;
  input Real a,x;
  output Real y;

  external "C" y = gsl_sf_poch(a,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Pochhammer symbol, </span><span style=\"background-color: rgb(255, 255, 255);\"><i style=\"font-family: 'Times New Roman';\">(a)<sub>x</sub>&nbsp;= Gamma(a+x)/Gamma(a)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end poch_ax;