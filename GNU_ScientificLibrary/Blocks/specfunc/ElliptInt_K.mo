within GNU_ScientificLibrary.Blocks.specfunc;
block ElliptInt_K
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

equation
  y=Functions.specfunc.elliptint_K(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="K(k)")}),
          Documentation(info = "<html><head></head><body><div>This function block computes K(k):&nbsp;</div><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/elliptint.png\"></div></body></html>"));
end ElliptInt_K;