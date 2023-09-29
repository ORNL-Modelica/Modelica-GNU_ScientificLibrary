within GNU_ScientificLibrary.Blocks.specfunc;
block Hydrogen_Rnl
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_lm_Block;

equation
  y=Functions.specfunc.hydrogen_Rnl(l, m, x);
  annotation (Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, lineColor = {0, 0, 0}, textString = "R_nl(x)")}),
  Documentation(info = "<html><head></head><body><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">This block computes the normalized Hydrogen wavefunction, R</span><sub style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">nl</sub><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">(r) [l&lt;--n , m&lt;--l in F_lm block].</span><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/Rnl.png\"></div></body></html>"));
end Hydrogen_Rnl;