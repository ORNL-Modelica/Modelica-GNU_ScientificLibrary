within GNU_ScientificLibrary.Blocks.specfunc;
block ExpInt_Ei
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y=Functions.specfunc.expint_Ei(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="Ei(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/Ei.png\"></div></body></html>"));
end ExpInt_Ei;