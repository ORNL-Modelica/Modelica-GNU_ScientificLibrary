within GNU_ScientificLibrary.Functions.integration;

function qawo "QAWO integration routine"
  extends Modelica.Icons.Function;
  input Integer n_par;
  input Real par[n_par],a,b,omega,rel_err;
  input Integer isine, limit;
  output Real y, err;
  
  external "C" qawo_mi(y, err, par, a, b, omega, isine, rel_err, limit) annotation(
    Library = "gsl_integration_MI");
  annotation(
    Documentation(info = "<html><head></head><body>Function for accessing the external GSL QAWO integration routine, which calculates the definite integral of an oscillatory function.<div><br></div><div>Keep in mind that the 'integrand' must be \"created\" beforehand: see the 'CreateIntegrand' model and the 'integrand_setup' function. Note that here f is to be defined without the sin or cos part:&nbsp;</div><div><img src=\"modelica://GNU_ScientificLibrary/Functions/integration/gsl_qawo.png\"></div></body></html>"));
end qawo;