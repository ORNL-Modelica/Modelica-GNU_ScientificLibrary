double integrand( double x );
void qag_mi( double *res , double *err , double a , double b , double rel_err , int limit , int key );
void qags_mi( double *res , double *err , double a , double b , double rel_err , int limit );
void qagi_mi( double *res , double *err , double rel_err , int limit );
void qagiu_mi( double *res , double *err , double a , double rel_err , int limit );
void qagil_mi( double *res , double *err , double b , double rel_err , int limit );
void qawc_mi( double *res , double *err , double a , double b , double c, double rel_err , int limit );
void qawo_mi( double *res , double *err , double a , double b , double omega, int isine, double rel_err , int limit );
void cquad_mi( double *res , double *err , double a , double b , double rel_err , int n_int );
