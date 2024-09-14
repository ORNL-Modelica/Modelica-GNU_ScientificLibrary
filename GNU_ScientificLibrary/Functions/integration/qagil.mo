within GNU_ScientificLibrary.Functions.integration;

function qagil "QAGIL integration routine"
  extends Modelica.Icons.Function;
  input Real b, rel_err;
  input Integer limit;
  output Real y, err;
  protected String cwd = Modelica.Utilities.System.getWorkDirectory();
  
  external "C" qagil_mi(y, err, b, rel_err, limit) annotation(
    Library = "gsl_integration_MI");
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAGIL integration routine, for integration from -infinity to b.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div></body></html>"));
end qagil;