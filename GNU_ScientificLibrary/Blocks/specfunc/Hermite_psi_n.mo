within GNU_ScientificLibrary.Blocks.specfunc;
block Hermite_psi_n
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.hermite_func_psi_n(l, x);
  annotation (Icon(graphics={Text(
          extent={{-74,20},{74,-10}},
          lineColor={0,0,0},
          textString="psi(n,x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/hermite_func.png\"></div></body></html>"));
end Hermite_psi_n;