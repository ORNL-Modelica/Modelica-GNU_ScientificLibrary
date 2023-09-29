within GNU_ScientificLibrary.Blocks.specfunc;
block Hermite_Hn
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.hermite_Hn(l, x);
  annotation (Icon(graphics={Text(
          extent={{-74,20},{74,-10}},
          lineColor={0,0,0},
          textString="H_n(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/hermite.png\"></div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/HnDE.png\"></div></body></html>"));
end Hermite_Hn;