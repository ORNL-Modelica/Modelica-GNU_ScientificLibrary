within GNU_ScientificLibrary.Blocks.specfunc;
block Debye_D6
  extends Blocks.Interfaces.Block_xy;
equation
  y = Functions.specfunc.debye_D6(x);
  annotation(
    Icon(graphics = {Text(extent = {{-78, 18}, {70, -12}}, lineColor = {0, 0, 0}, textString = "D_3(x)")}),
    Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/debye.png\"></div></body></html>"));
end Debye_D6;