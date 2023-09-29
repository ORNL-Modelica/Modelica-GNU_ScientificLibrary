within GNU_ScientificLibrary.Blocks.specfunc;
block Laguerre_Ln
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_G_n_Block;

equation
  y=Functions.specfunc.laguerre_Ln(n,a,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="L_n^a(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/laguerre.png\"></div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/laguerre_Ln.png\"></div></body></html>"));
end Laguerre_Ln;