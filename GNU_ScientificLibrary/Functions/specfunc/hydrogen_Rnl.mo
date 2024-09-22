within GNU_ScientificLibrary.Functions.specfunc;
function hydrogen_Rnl
  "Normalized Hydrogen wavefunction of order n,l"
  extends Modelica.Icons.Function;

input Integer n,l;
input Real x;
output Real y;

external "C" y=gsl_sf_hydrogenicR(n,l,1,x) annotation(Library="gsl");
  annotation (Documentation(info= "<html><head></head><body><p><span style=\"font-family: Times New Roman; background-color: #ffffff;\">This routine computes the normalized Hydrogen wavefunction, R<sub>nl</sub>(r).</span></p>
</body></html>"));
end hydrogen_Rnl;