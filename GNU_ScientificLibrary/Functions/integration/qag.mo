within GNU_ScientificLibrary.Functions.integration;

function qag "QAG integration routine"
  extends Modelica.Icons.Function;
  input Real a,b,rel_err;
  input Integer limit,key;
  output Real y,err;
  protected String cwd=Modelica.Utilities.System.getWorkDirectory();

// LibraryDirectory info here appears to be insufficient:
//  'integrand_setup' therefore also copies libgsl_integration_MI.a to default location 
  external "C" qag_mi(y,err,a,b,rel_err,limit,key) annotation(Library="gsl_integration_MI",LibraryDirectory=cwd);
  annotation(Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAG integration routine.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qag.png\"></div></body></html>"));
end qag;