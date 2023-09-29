within GNU_ScientificLibrary.Blocks.specfunc;
block ExpInt_En
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.expint_En(l, x);
  annotation (Icon(graphics={Text(
          extent={{-74,20},{74,-10}},
          lineColor={0,0,0},
          textString="E(n,x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/En.png\"></div></body></html>"));
end ExpInt_En;