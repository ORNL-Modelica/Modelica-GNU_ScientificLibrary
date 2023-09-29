within GNU_ScientificLibrary.Blocks.specfunc;
block Airy_zeroAi
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_iy;
equation
  y=Functions.specfunc.airy_zeroAi(i);
  annotation (Icon(graphics = {Text(extent = {{-74, 20}, {74, -10}}, textString = "Ai(x_i)=0")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">This function block computes the i</span><sup style=\"font-family: 'Times New Roman'; background-color: rgb(255, 255, 255);\">th</sup><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">&nbsp;zero of the Airy function</span><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">,&nbsp;</span><i style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">Ai(x)</i><span style=\"font-family: 'Times New Roman'; font-size: 12px; background-color: rgb(255, 255, 255);\">.</span></body></html>"));
end Airy_zeroAi;
