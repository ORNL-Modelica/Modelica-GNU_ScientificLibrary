within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_J0
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block(final l=0);

equation
  y=Functions.specfunc.bessel_J0(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="J_0(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end Bessel_J0;
