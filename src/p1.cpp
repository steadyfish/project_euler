#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double compute_s_i_cpp(int a1, int thresh){
  int n = (thresh-1) / a1;
  int an = a1 * n;
  int s_i = (a1 + an) * n / 2;
  return s_i;
}

