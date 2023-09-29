within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_Yn
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.bessel_Yn(l,x);
  annotation (Icon(graphics={Text(
          extent={{-66,20},{72,-14}},
          lineColor={0,0,0},
          textString="Y_n(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end Bessel_Yn;
