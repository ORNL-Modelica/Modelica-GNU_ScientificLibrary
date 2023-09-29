within GNU_ScientificLibrary.Blocks.specfunc;
block SphHarm_Ylm
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_lm_Block;

equation
  y=Functions.specfunc.sph_harm_Ylm(l, m, x);
  annotation (Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, lineColor = {0, 0, 0}, textString = "Y_lm(x)")}),
  Documentation(info = "<html><head></head><body><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">This block computes the normalized spherical harmonic, Y</span><sub style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">lm</sub><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">(x), where x=cos(theta) and to complete the function a factor of </span><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">e</span><sup style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">i*m*phi&nbsp;</sup><span style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">is needed.</span><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/PlmDE.png\"></div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/Ylm.png\"></div></body></html>"));
end SphHarm_Ylm;