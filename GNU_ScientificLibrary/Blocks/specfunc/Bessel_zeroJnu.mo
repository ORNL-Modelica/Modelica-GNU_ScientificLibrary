within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_zeroJnu
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_iy;
  parameter Real nu=0.0 "Order of the Bessel function J_nu";
equation
  y=Functions.specfunc.bessel_zeroJnu(nu,i);
  annotation (Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "J_nu(x_i)=0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">This function block computes the i</span><sup style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">th</sup><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">&nbsp;zero of the regular Bessel function of order&nbsp;</span><i style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">nu</i><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">,&nbsp;</span><i style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">J_nu(x)</i><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">.</span></body></html>"));
end Bessel_zeroJnu;