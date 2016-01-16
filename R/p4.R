# Problem 4



# largest palindrome made from product of two 3 digit numbers
is_palindrome <- function(word) {
  raw <- charToRaw(tolower(word)) ## converts to lower case
  rev_raw <- rev(raw)
  ret = identical(raw, rev_raw)
  return(ret)
}

a = rep(0:100)
out=  data.frame(num1 = a, num2 = a, prod = a)
k = 1
for(i in 999:900){
  for(j in 999:i){
    prod = i * j
    res = is_palindrome(prod)
    if(res) {
      print(paste0("numbers: ", i, ", ", j, ". Product: ", prod))
      out[k,] = c(i, j, prod)
    }
  }
}
