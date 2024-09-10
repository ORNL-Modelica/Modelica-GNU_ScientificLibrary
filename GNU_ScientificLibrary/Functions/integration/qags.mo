within GNU_ScientificLibrary.Functions.integration;

function qags "QAGS integration routine"
  extends Modelica.Icons.Function;
  input Real a, b, rel_err;
  input Integer limit;
  output Real y, err;
  protected String cwd = Modelica.Utilities.System.getWorkDirectory();
  
  external "C" qags_mi(y, err, a, b, rel_err, limit) annotation(
    Library = "gsl_integration_MI",
    LibraryDirectory = cwd);
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAGS integration routine, which is limited to the 21-point GK routine, but can handle singularities in the region of integration.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div></body></html>"));
end qags;