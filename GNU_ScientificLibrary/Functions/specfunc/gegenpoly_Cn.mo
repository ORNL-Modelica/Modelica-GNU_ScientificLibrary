within GNU_ScientificLibrary.Functions.specfunc;

function gegenpoly_Cn "Genenbauer polynomial, C_n^(a)(x)"
  extends Modelica.Icons.Function;
  input Integer n;
  input Real a,x;
  output Real y;

  external "C" y = gsl_sf_gegenpoly_n(n,a,x) annotation(
    Library = "gsl");
  annotation(
    Documentation(info = "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the Gegenbauer polynomial, </span><span style=\"background-color: rgb(255, 255, 255);\"><i style=\"font-family: 'Times New Roman';\">C<sub>n</sub><sup>(a)</sup>(x)</i><span style=\"font-family: 'Times New Roman';\">.</span></span></p>
</body></html>"));
end gegenpoly_Cn;