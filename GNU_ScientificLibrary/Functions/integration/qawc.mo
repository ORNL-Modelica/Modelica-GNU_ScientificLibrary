within GNU_ScientificLibrary.Functions.integration;

function qawc "QAWC integration routine"
  extends Modelica.Icons.Function;
  input Real a, b, c, rel_err;
  input Integer limit;
  output Real y, err;
  protected String cwd = Modelica.Utilities.System.getWorkDirectory();
  
  external "C" qags_mi(y, err, a, b, c, rel_err, limit) annotation(
    Library = "gsl_integration_MI",
    LibraryDirectory = cwd);
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAWC integration routine, which calculates the Cauchy principal value of a function with a singular point at x=c.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function. Note that here f is to be defined without the singular 1/(x-c) part:&nbsp;</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qawc.png\"></div></body></html>"));
end qawc;