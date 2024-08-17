within GNU_ScientificLibrary.Functions.integration;

function integrand "Integrand function"
  extends Modelica.Icons.UnderConstruction;
//  extends Modelica.Icons.Function;
  input Real x;
  output Real f;

external "C" f = integrand(x) annotation(Library="libgsl_integration_MI");
  annotation(Documentation(info = "<html><head></head><body>forthcoming...</body></html>"));
end integrand;