# Problem 3


# Largest prime factor of the number 600851475143 

# attempt 1
check_for_primality <- function(num){
  thresh = floor(sqrt(num))
  prime_flag = 1
  if(num %in% c(2, 3)) return(prime_flag)
  for(i in 2:thresh){
    mod = num %% i
    if(mod == 0){
      prime_flag = 0
      print(paste0(num, "is not a prime_number. Factor: ", i))
      break
    }
  }
  return(prime_flag)
}

get_largest_prime_factor <- function(n_in){
  
  k = 1
  for(i in 3:(10000)){ # (600851475143/3)
    mod = n_in %% i
    if(mod == 0){
      print(paste0("i: ", i))
      fac_big = n_in / i
      prime_flag = check_for_primality(fac_big)
      print(paste0("prime_flag: ", prime_flag))
      if(prime_flag == 1){
        print(paste0("largest prime factor:", fac_big))
        break
      }
      n_in = fac_big
      print(paste0("new n_in: ", n_in))
      k = k + 1
    }
  }
  
  return(fac_big)
}

out = get_largest_prime_factor(n_in = 600851475143)

# attempt 2
library(Rcpp)
sourceCpp("src/p3.cpp")
out = get_largest_prime_factor_cpp(n_in = 600851475143)
