within GNU_ScientificLibrary.Functions.integration;

function qag "QAG integration routine"
  extends Modelica.Icons.UnderConstruction;
//  extends Modelica.Icons.Function;
  input Real a,b,rel_err;
  input Integer limit,key;
  output Real y,err;

external "C" qag_mi(y,err,a,b,rel_err,limit,key) annotation(Library="libgsl_integration_MI");
  annotation(Documentation(info = "<html><head></head><body>forthcoming...</body></html>"));
end qag;