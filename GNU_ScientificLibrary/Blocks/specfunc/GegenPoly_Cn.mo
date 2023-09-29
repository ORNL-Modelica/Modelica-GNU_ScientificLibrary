within GNU_ScientificLibrary.Blocks.specfunc;
block GegenPoly_Cn
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_G_n_Block;

equation
  y=Functions.specfunc.gegenpoly_Cn(n,a,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="C_n^(a)(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/gegen.png\"></div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/gegen_Cn.png\"></div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/gegen_Can.png\"></div></body></html>"));
end GegenPoly_Cn;