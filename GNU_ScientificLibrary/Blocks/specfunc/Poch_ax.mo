within GNU_ScientificLibrary.Blocks.specfunc;
block Poch_ax
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_axy;

equation
  y=Functions.specfunc.poch_ax(a,x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="(a)_x")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/poch.png\"></div></body></html>"));
end Poch_ax;