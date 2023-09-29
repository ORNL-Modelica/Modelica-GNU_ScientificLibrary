within GNU_ScientificLibrary.Blocks.specfunc;
block Beta_Bab
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_axy;

equation
  y=Functions.specfunc.beta_Bab(a,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="Beta(a,b)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/beta.png\"></div></body></html>"));
end Beta_Bab;