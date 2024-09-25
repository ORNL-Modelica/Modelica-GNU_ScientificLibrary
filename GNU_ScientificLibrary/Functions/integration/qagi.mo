within GNU_ScientificLibrary.Functions.integration;

function qagi "QAGI integration routine"
  extends Modelica.Icons.Function;
  input Integer n_par;
  input Real par[n_par],rel_err;
  input Integer limit;
  output Real y, err;
  protected final parameter Real kludge = Functions.specfunc.gamma(1);
  
  external "C" qagi_mi(y, err, par, rel_err, limit) annotation(
    Library = "gsl_integration_MI");
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAGI integration routine, for integration from - to + infinity.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qagi.png\"></div><div><br></div></body></html>"));
end qagi;