/*  interface between GSL integration routines and C-copy of a Modelica function (the integrand)  */
#include <stdio.h>
#include <math.h>

#include "integration_mi.h"
#include "gsl/gsl_integration.h"

void qag_mi( double *res , double *err , double a , double b , double rel_err , int limit , int key ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand;

  gsl_integration_qag(&FF,a,b,0,rel_err,limit,key,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}
