within GNU_ScientificLibrary.Blocks.specfunc;
block Dilog_Li2
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y=Functions.specfunc.dilog_Li2(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="Li_2(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/dilog.png\"></div></body></html>"));
end Dilog_Li2;