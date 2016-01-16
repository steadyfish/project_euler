# Problem 2

# sum of even fibonacci numbers less than 4 million

thresh = 4000000
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

