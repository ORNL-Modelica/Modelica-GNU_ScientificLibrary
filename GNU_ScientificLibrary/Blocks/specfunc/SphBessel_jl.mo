within GNU_ScientificLibrary.Blocks.specfunc;
block SphBessel_jl
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.sph_bessel_jl(l, x);
  annotation (Icon(graphics={Text(
          extent={{-74,20},{74,-10}},
          lineColor={0,0,0},
          textString="j_l(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/bessel.png\"></div></body></html>"));
end SphBessel_jl;