within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_Kn
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.bessel_Kn(l,x);
  annotation (Icon(graphics={Text(
          extent={{-70,22},{78,-16}},
          lineColor={0,0,0},
          textString="K_n(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end Bessel_Kn;
