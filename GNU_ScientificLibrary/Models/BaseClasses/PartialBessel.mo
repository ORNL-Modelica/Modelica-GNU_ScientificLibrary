within GNU_ScientificLibrary.Models.BaseClasses;
model PartialBessel
  extends Modelica.Blocks.Interfaces.SO;

  parameter Integer n = 0 "Order of the Bessel function";
  input Real x=1 "Value of interest" annotation(Dialog(group="Input Variables:"));

end PartialBessel;
