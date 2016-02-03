# Problem 7

# the 10001st prime number
is_prime = function(num, prime_db){
  if(num==2) return(TRUE)
  mod = min(num %% prime_db[prime_db != FALSE])
  if(mod > 0) return(TRUE)
  return(FALSE)
}

find_n_primes = function(n, prime_db){
  prime_db = vector(length = n)
  k = 1
  i = 2
  while(k <= n){
    # print(paste0("i: ",i, "k: ", k))
    if(is_prime(i, prime_db)){
      prime_db[k] = i
      k = k + 1
    }
    i = i + 1
  }
  return(prime_db)
}

n = 10001
out = find_n_primes(n)
tail(out)
