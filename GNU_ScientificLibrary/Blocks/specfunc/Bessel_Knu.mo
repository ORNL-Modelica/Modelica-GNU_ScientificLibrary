within GNU_ScientificLibrary.Blocks.specfunc;
block Bessel_Knu
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_nu_Block;

equation
  y=Functions.specfunc.bessel_Knu(nu, x);
  annotation (Icon(graphics={Text(
          extent={{-74,20},{74,-10}},
          lineColor={0,0,0},
          textString="K_nu(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end Bessel_Knu;