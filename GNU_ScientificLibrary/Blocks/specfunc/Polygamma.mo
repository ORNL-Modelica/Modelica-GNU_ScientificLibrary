within GNU_ScientificLibrary.Blocks.specfunc;
block Polygamma
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.polygamma(l,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="psi^(n)(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/polygamma.png\"></div></body></html>"));
end Polygamma;