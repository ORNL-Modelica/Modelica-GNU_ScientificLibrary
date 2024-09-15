within GNU_ScientificLibrary.Functions.integration;

function qagiu "QAGIU integration routine"
  extends Modelica.Icons.Function;
  input Integer n_par;
  input Real par[n_par],a,rel_err;
  input Integer limit;
  output Real y, err;
  
  external "C" qagiu_mi(y, err, par, a, rel_err, limit) annotation(
    Library = "gsl_integration_MI");
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAGIU integration routine, for integration from a to +infinity.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div></body></html>"));
end qagiu;