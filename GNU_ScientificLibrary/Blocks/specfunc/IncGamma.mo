within GNU_ScientificLibrary.Blocks.specfunc;
block IncGamma
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_axy;

equation
  y=Functions.specfunc.incgamma(a,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="Gamma(a,x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/incgamma.png\"></div></body></html>"));
end IncGamma;