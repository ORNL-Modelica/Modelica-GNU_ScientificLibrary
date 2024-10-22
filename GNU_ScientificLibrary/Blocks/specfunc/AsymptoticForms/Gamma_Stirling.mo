within GNU_ScientificLibrary.Blocks.specfunc.AsymptoticForms;
block Gamma_Stirling
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y = sqrt(2*Modelica.Constants.pi)*exp(-x)*x^(x-0.5);
  annotation (Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = "lim Gamma")}),
  Documentation(info = "<html><head></head><body>Asymptotic form of Gamma(x) for x&gt;&gt;1 (Stirling's or Lanczos's approximation).</body></html>"));
end Gamma_Stirling;