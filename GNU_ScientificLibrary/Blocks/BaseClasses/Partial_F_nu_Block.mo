within GNU_ScientificLibrary.Blocks.BaseClasses;
partial model Partial_F_nu_Block
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_xy;

  parameter Real nu = 0 "Order of the function";annotation(
    Documentation(info = "<html><head></head><body>Partial function block with real parameter, nu, for the function order.</body></html>"));

end Partial_F_nu_Block;