within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_In
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.bessel_In(l, x);
  annotation (Icon(graphics={Text(
          extent={{-74,24},{82,-12}},
          lineColor={0,0,0},
          textString="I_n(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end Bessel_In;
