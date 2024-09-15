#include <stdio.h>
#include <math.h>

#include "integration_mi.h"
#include "gsl/gsl_integration.h"

double integrand( double x , double *par ){
  double f;
  
f=exp(-par[0]*x*x);return(f);}
