within GNU_ScientificLibrary.Blocks.specfunc.AsymptoticForms;
block FermiDirac_FnuAsymp
  // block by tommy.burch@physik.uni-r.de
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_nu_Block;

equation
  y = if x<1 then exp(x) else (x^(nu+1.0))/GNU_ScientificLibrary.Functions.specfunc.gamma(nu+2.0);
  annotation (Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = "lim F_nu")}),
  Documentation(info = "<html><head></head><body>Asymptotic forms for F<sub>nu</sub>(x) for x&lt;&lt;-1 and x&gt;&gt;1 (switch from former to latter placed at x=1).</body></html>"));
end FermiDirac_FnuAsymp;
