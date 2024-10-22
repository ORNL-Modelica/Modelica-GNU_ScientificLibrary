within GNU_ScientificLibrary.Functions.integration;

function qag "QAG integration routine"
  extends Modelica.Icons.Function;
  input Integer n_par;
  input Real par[n_par],a,b,rel_err;
  input Integer limit,key;
  output Real y,err;
  // kludge: if not already present in the model, a direct call to a GSL function appears 
  //  to be required to have libgsl load along with the interface (???!!!) 
  protected final parameter Real kludge = Functions.specfunc.gamma(1);

// LibraryDirectory info here appears to be insufficient:
  //  'integrand_setup' therefore also copies libgsl_integration_MI.so to default location
  external "C" qag_mi(y,err,par,a,b,rel_err,limit,key) annotation(
    Library = "libgsl_integration_MI");
  annotation(Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAG integration routine.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qag.png\"></div></body></html>"));
end qag;