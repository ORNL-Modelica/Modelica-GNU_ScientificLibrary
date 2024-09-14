within GNU_ScientificLibrary.Functions.integration;

function integrand "Integrand function"
  extends Modelica.Icons.Function;
  input Real x;
  output Real f;

external "C" f = integrand(x) annotation(Library="gsl_integration_MI");
  annotation(Documentation(info = "<html><head></head><body>Function for accessing external GSL/Modelica-interface 'integrand' function.<div><div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function.</div></div></body></html>"));
end integrand;
