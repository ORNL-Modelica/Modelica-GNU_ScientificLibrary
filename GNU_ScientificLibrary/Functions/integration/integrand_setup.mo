within GNU_ScientificLibrary.Functions.integration;

impure function integrand_setup "Integrand Setup for GSL integration routines"
  // contact: tommy.burch@physik.uni-r.de
  extends Modelica.Icons.Function;
  input String C_integrand = "exp(-x*x)";
  output Integer rcode[2];
  protected String it_file,mi_file,mi_hfile,ar_file;
  protected String C_line = "f=" + C_integrand + ";return(f);}";

algorithm
// need system commands to construct the integrand C function, compile the object file,
//   and build the archive file
//  cwd := Modelica.Utilities.System.getWorkDirectory();
  it_file := Modelica.Utilities.Files.loadResource("modelica://GNU_ScientificLibrary/Resources/Source/itop.c");
  mi_file := Modelica.Utilities.Files.loadResource("modelica://GNU_ScientificLibrary/Resources/Source/integration_mi.c");
  mi_hfile := Modelica.Utilities.Files.loadResource("modelica://GNU_ScientificLibrary/Resources/Include/integration_mi.h");
  Modelica.Utilities.Files.copy(it_file,"integrand.c",replace=true);
  Modelica.Utilities.Files.copy(mi_file,"integration_mi.c",replace=true);
  Modelica.Utilities.Files.copy(mi_hfile,"integration_mi.h",replace=true);
  Modelica.Utilities.Streams.print(C_line,"integrand.c");
  rcode[1] := Modelica.Utilities.System.command("gcc -fPIC -c integration_mi.c integrand.c");
  rcode[2] := Modelica.Utilities.System.command("gcc -shared integration_mi.o integrand.o -o libgsl_integration_MI.so");
// pointing out other possible LibraryDirectory (e.g., in qag) seems not to work:
//   copying archive file to default directory...
  ar_file := Modelica.Utilities.Files.loadResource("modelica://GNU_ScientificLibrary/Resources/Library/libgsl_integration_MI.so");
  Modelica.Utilities.Files.copy("libgsl_integration_MI.so",ar_file,replace=true);
  ar_file := Modelica.Utilities.Files.loadResource("modelica://GNU_ScientificLibrary/Resources/Library/libgsl_integration_MI.dll");
  Modelica.Utilities.Files.copy("libgsl_integration_MI.so",ar_file,replace=true);
  annotation(Documentation(info = "<html><head></head><body>Integrand-setup \"function\" for using GSL integration routines within a larger Modelica model.<div><br></div><div>Wherever possible, Modelica.Utilities routines are used to handle file / system commands. The current exception is the use of 'gcc' to compile the libgsl_integration_MI.so / libgsl_integration_MI.dll library. This is standard on any Linux system and is available for any Windows system via 'mingw'.</div></body></html>"));
end integrand_setup;
