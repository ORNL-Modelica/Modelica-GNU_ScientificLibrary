within GNU_ScientificLibrary.Blocks.specfunc;
block FermiDirac_Fn
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block;

equation
  y=Functions.specfunc.fermidirac_Fn(l,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="F_n(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/FD.png\"></div></body></html>"));
end FermiDirac_Fn;
