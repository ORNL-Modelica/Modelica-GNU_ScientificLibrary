/*  interface between GSL integration routines and C-version of a Modelica function (the integrand) 
     created 01.2024 -- tb ( tommy.burch@physik.uni-r.de ) 
     
     -- first successfully tested on Linux/OpenModelica with QAG routine, v1.0.2, 09.2024 (tb) 
     -- added QAGS, QAGI*, QAWC, QAWO, CQUAD routines, v1.0.3, 09.2024 (tb) 
     -- adding parameter passing option, v1.0.4, 09.2024 (tb) 
*/
#include <stdio.h>
#include <math.h>

#include "integration_mi.h"
#include "gsl/gsl_integration.h"
#include "gsl/gsl_specfunc.h"


double integrand_gsl( double x , void *params ){
  double f;
  double *par;

  par = (double *) params;
  f = integrand(x,par);

  return(f);
}


void qag_mi( double *res , double *err , double *par , double a , double b , double rel_err , int limit , int key ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qag(&FF,a,b,0,rel_err,limit,key,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qags_mi( double *res , double *err , double *par , double a , double b , double rel_err , int limit ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qags(&FF,a,b,0,rel_err,limit,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qagi_mi( double *res , double *err , double *par , double rel_err , int limit ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qagi(&FF,0,rel_err,limit,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qagiu_mi( double *res , double *err , double *par , double a , double rel_err , int limit ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qagiu(&FF,a,0,rel_err,limit,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qagil_mi( double *res , double *err , double *par , double b , double rel_err , int limit ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qagil(&FF,b,0,rel_err,limit,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qawc_mi( double *res , double *err , double *par , double a , double b , double c, double rel_err , int limit ){

  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_qawc(&FF,a,b,c,0,rel_err,limit,w,res,err);

  gsl_integration_workspace_free(w);

  return;
}


void qawo_mi( double *res , double *err , double *par , double a , double b , double omega, int isine, double rel_err , int limit ){

  int icode;
  double L = b - a;
  int n = (int)(log10(2.0/rel_err)) + 1;
  //  gsl_integration_qawo_enum sine = (isine==0) ? GSL_INTEG_COSINE : GSL_INTEG_SINE;
  int sine = (isine==0) ? GSL_INTEG_COSINE : GSL_INTEG_SINE;
  gsl_integration_workspace *w = gsl_integration_workspace_alloc(limit);
  gsl_integration_qawo_table *t = gsl_integration_qawo_table_alloc(omega,L,sine,n);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  icode = gsl_integration_qawo(&FF,a,0,rel_err,limit,w,t,res,err);
  /*
  while( icode == GSL_ETABLE ){
    gsl_integration_qawo_table_free(t);
    n++;
    gsl_integration_qawo_table *t = gsl_integration_qawo_table_alloc(omega,L,sine,n);
    icode = gsl_integration_qawo(&FF,a,0,rel_err,limit,w,t,res,err);
  }
  */

  gsl_integration_qawo_table_free(t);
  gsl_integration_workspace_free(w);

  return;
}


void cquad_mi( double *res , double *err , double *par , double a , double b , double rel_err , int n_int ){

  size_t neval;
  gsl_integration_cquad_workspace *w = gsl_integration_cquad_workspace_alloc(n_int);

  gsl_function FF;
  FF.function = &integrand_gsl;
  FF.params = par;

  gsl_integration_cquad(&FF,a,b,0,rel_err,w,res,err,&neval);

  gsl_integration_cquad_workspace_free(w);

  return;
}
