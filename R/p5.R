# Problem 5
library(vecsets)
# smallest positive number that is evenly divisible by all numbers from 1 to 20

check_for_primality <- function(num){
  thresh = floor(sqrt(num))
  prime_flag = 1
  if(num %in% c(2, 3)) return(prime_flag)
  for(i in 2:thresh){
    mod = num %% i
    if(mod == 0){
      prime_flag = 0
      break
    }
  }
  return(prime_flag)
}

find_primes_in_range <- function(min, max){
  out = rep(1, (max-min+1))
  k = 1
  for(i in min:max){
    if(check_for_primality(i) == 1){
      out[k] = i  
      k = k + 1
    }
    
  }
  return(out)
}

# good
find_prime_factors = function(num, primes){
  out = rep(1, num/2)
  k = 1
  thresh = num
  # print(thresh)
  while(num > 1){
    for(i in 2:thresh){
      prime_flag = ifelse(i %in% primes, 1, 0)
      # print(paste0("find_prime_factors: i: ", i, " num: ", num, "prime_flag: ", prime_flag))
      if(prime_flag){
        mod = num %% i
        # print(paste0("i: ", i, " num: ", num, "mod: ", mod))
        if(mod == 0){
          out[k] = i
          num = num / i
          if(num == 1){
            break
          }
          k = k + 1
        }
      }
    }
  }
  
  return(out)
}

find_lcm <- function(num1, num2, primes, num1_facs, num2_facs){
  if(!missing(num1_facs)){
    facs1 = num1_facs
  }else{
    facs1 = find_prime_factors(num1, primes)
  }
  if(!missing(num2_facs)){
    facs2 = num2_facs
  }else{
    facs2 = find_prime_factors(num2, primes)
  }
  # common_facs = vintersect(facs1, facs2)
  # lcm = prod(facs1) * prod(facs2) / prod(common_facs)#prod(intersect(facs1, facs2))
  lcm = prod(vunion(facs1, facs2))
  return(list(lcm = lcm,
              lcm_facs = vunion(facs1, facs2)))
}

find_lcm_range = function(min, max){
  primes = find_primes_in_range(min, max)
  # print(primes)
  lcm = 1
  ret_lcm_ls = find_lcm(lcm, 2, primes)
  for(i in 2:max){
    num1_facs = ret_lcm_ls$lcm_facs
#     print(paste0("i: ", i," lcm: ", lcm))
#     print( num1_facs)
    ret_lcm_ls = find_lcm(lcm, i, primes, num1_facs = num1_facs)
    lcm = max(lcm, ret_lcm_ls$lcm)
    # print(paste0("i: ", i, "lcm: ", lcm))
  }
  return(lcm)
}

res = find_lcm_range(1, 20)


