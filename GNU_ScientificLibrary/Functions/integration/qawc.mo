within GNU_ScientificLibrary.Functions.integration;

function qawc "QAWC integration routine"
  extends Modelica.Icons.Function;
  input Integer n_par;
  input Real par[n_par],a,b,c,rel_err;
  input Integer limit;
  output Real y, err;
  protected final parameter Real kludge = Functions.specfunc.gamma(1);
  
  external "C" qawc_mi(y, err, par, a, b, c, rel_err, limit) annotation(
    Library = "libgsl_integration_MI");
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAWC integration routine, which calculates the Cauchy principal value of a function with a singular point at x=c.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function. Note that here f is to be defined without the singular 1/(x-c) part:&nbsp;</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qawc.png\"></div></body></html>"));
end qawc;