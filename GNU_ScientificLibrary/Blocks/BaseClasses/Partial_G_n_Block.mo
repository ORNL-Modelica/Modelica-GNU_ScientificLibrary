within GNU_ScientificLibrary.Blocks.BaseClasses;
partial model Partial_G_n_Block
  extends GNU_ScientificLibrary.Blocks.Interfaces.Block_axy;

  parameter Integer n = 0 "Order of the function";annotation(
    Documentation(info = "<html><head></head><body>Partial function [G_n(a,x)] block with integer parameter, n, for the function order.</body></html>"));

end Partial_G_n_Block;