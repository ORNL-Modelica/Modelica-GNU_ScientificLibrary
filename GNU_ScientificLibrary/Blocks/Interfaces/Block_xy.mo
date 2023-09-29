within GNU_ScientificLibrary.Blocks.Interfaces;
partial block Block_xy
  extends GNU_ScientificLibrary.Icons.Block;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation(
    Documentation(info = "<html><head></head><body>Partial block with one real input, x, and one real output, y.</body></html>"));


end Block_xy;