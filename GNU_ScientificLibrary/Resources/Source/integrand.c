#include <stdio.h>
#include <math.h>

#include "integration_mi.h"
#include "gsl/gsl_integration.h"

double integrand( double x ){
  double f;

  f=exp(-x*x);return(f);}

