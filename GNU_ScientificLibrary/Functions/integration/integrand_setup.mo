within GNU_ScientificLibrary.Functions.integration;

impure function integrand_setup "Integrand Setup for GSL integration routines"
  extends Modelica.Icons.UnderConstruction;
//  extends Modelica.Icons.Function;
  input String integrand = "exp(-x*x)";
  output Integer rcode[6];
  protected String cwd;
  protected String cline = "f=" + integrand + ";return(f);}";

algorithm
// need system commands to construct the integrand C function, compile the object file,
//  and build the archive file
// !!! should replace system-specific commands with Modelica.Utilities ones
  cwd := Modelica.Utilities.System.getWorkDirectory();
//  rcode[1] := Modelica.Utilities.System.command("cd GNU_ScientificLibrary://Resources/Include/");
  rcode[1] := Modelica.Utilities.System.command("cd ../../Resources/Include/");
  rcode[2] := Modelica.Utilities.System.command("cp -f itop.c integrand.c");
  Modelica.Utilities.Streams.print(cline,"integrand.c");
  rcode[3] := Modelica.Utilities.System.command("gcc -c integration_mi.c integrand.c");
  rcode[4] := Modelica.Utilities.System.command("ar cr libgsl_integration_MI.a integration_mi.o integrand.o");
  rcode[5] := Modelica.Utilities.System.command("mv -f libgsl_integration_MI.a ../Library/");
  rcode[6] := Modelica.Utilities.System.command("cd " + cwd);
  annotation(Documentation(info = "<html><head></head><body>forthcoming...</body></html>"));
end integrand_setup;