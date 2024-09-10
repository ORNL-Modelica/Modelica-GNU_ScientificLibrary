within GNU_ScientificLibrary.Functions.integration;

function cquad "CQUAD integration routine"
  extends Modelica.Icons.Function;
  input Real a, b, rel_err;
  input Integer n_int;
  output Real y, err;
  protected String cwd = Modelica.Utilities.System.getWorkDirectory();
  
  external "C" cquad_mi(y, err, a, b, rel_err, n_int) annotation(
    Library = "gsl_integration_MI",
    LibraryDirectory = cwd);
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL CQUAD doubly-adaptive integration routine, which can handle most types of singularities in the region of integration.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div></body></html>"));
end cquad;