# Problem 2

# sum of even fibonacci numbers less than 4 million

#attempt 1:
get_even_fib_sum <- function(thresh){
  a = vector(length = log(thresh, base =1.6) + 1 ) #thresh/exp(1)/3 + 1000)
  a[1] = 1
  a[2] = 2
  s = 2
  
  for(i in 3:(thresh/50)){
    a[i] = a[i-1] + a[i-2]
    if(a[i] > thresh) {
      print(paste0("i: ", i," ai: ", a[i]))
      break
    }
    else if((i+1) %% 3 == 0) {
      s = s + a[i]
      print(paste0("i: ", i," s: ", s))
    }
  }
  
  return(s)
}

thresh = 4000000
out = get_even_fib_sum(thresh)

# attempt 2:
library(Rcpp)
sourceCpp("src/p2.cpp")
thresh = 4000000
out1 = get_even_fib_sum_cpp(thresh)
