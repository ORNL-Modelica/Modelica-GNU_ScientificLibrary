within GNU_ScientificLibrary.Blocks.specfunc;
block Lambert_Wm1
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y=Functions.specfunc.lambert_Wm1(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="W_-1(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/lambert.png\"></div></body></html>"));
end Lambert_Wm1;