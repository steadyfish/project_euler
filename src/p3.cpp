#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
bool check_for_primality_cpp(double num){
  long thresh = floor(sqrt(num));
  bool prime_flag = TRUE;
  if((num == 2) | (num == 3)) return(prime_flag);
    for(int i = 2; i <= thresh; i++){
      int mod = fmod(num, i);
      if(mod == 0){
        prime_flag = FALSE;
        // print(paste0(num, "is not a prime_number. Factor: ", i))
        break;
      }
    }
    return(prime_flag);
}

// [[Rcpp::export]]
double get_largest_prime_factor_cpp(double n_in){
  
  int k = 1;
  double fac_big = n_in;
  for(int i = 3; i <= 10000; i++){ // (600851475143/3)
    int mod = fmod(n_in, i);
    if(mod == 0){
      // print(paste0("i: ", i))
      Rprintf("i: %d \\n", i);
      fac_big = n_in / i;
      bool prime_flag = check_for_primality_cpp(fac_big);
      // print(paste0("prime_flag: ", prime_flag))
      Rprintf("prime flag: %d \\n", prime_flag);
      if(prime_flag == 1){
        // print(paste0("largest prime factor:", fac_big))
        Rprintf("largest prime factor: %d \\n", fac_big);
        break;
      }
      n_in = fac_big;
      // print(paste0("new n_in: ", n_in))
      Rprintf("new n_in: %d\\n", n_in);
      k = k + 1;
    }
  }
  
  return(fac_big);
}
