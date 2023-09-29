within GNU_ScientificLibrary.Blocks.specfunc;
block FermiDirac_Fhalf
  extends GNU_ScientificLibrary.Blocks.BaseClasses.Partial_F_l_Block(final l=0);

equation
  y=Functions.specfunc.fermidirac_Fhalf(x);
  annotation (Icon(graphics={Text(
          extent={{-78,18},{70,-12}},
          lineColor={0,0,0},
          textString="F_1/2(x)")}),
          Documentation(info = "<html><head></head><body><div><img src=\"modelica://GNU_ScientificLibrary/Blocks/specfunc/FD.png\"></div><div>where j=1/2.</div></body></html>"));
end FermiDirac_Fhalf;