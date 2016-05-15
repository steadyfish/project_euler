#include <Rcpp.h>

using namespace Rcpp;

// [[Rcpp::export]]
double get_even_fib_sum_cpp(double thresh){
  double approx_size = ::log(thresh) / ::log(1.6); 
  int vec_size = ::ceil(approx_size) + 1 ;
  Rcpp::NumericVector a(vec_size);
  a[0] = 1;
  a[1] = 2;
  double s = 2;
  
  for(int i = 2; i < (thresh / 50); i++){
    a[i] = a[i-1] + a[i-2];
    if(a[i] > thresh) {
      
      Rprintf("i: %d ai: %lf \\n", i, a[i]);
      // print(paste0("i: ", i," ai: ", a[i]))
      break;
    }
    else if((i+2) % 3 == 0) {
      s = s + a[i];
      Rprintf("i: %d s: %lf \\n", i, s);
      // print(paste0("i: ", i," s: ", s))
    }
  }
  
  return(s);
}
