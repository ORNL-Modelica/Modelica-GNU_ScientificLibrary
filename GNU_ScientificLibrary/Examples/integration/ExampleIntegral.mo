within GNU_ScientificLibrary.Examples.integration;

model ExampleIntegral "Example integration using GSL"
  // extends Modelica.Icons.Example;
  extends Modelica.Icons.UnderConstruction;
  String integrand = "exp(-x*x)";
  Integer rcode[6];
initial equation
  rcode = GNU_ScientificLibrary.Functions.integration.integrand_setup(integrand);
equation
annotation(
    Documentation(info = "<html><head></head><body>forthcoming...</body></html>"));
end ExampleIntegral;