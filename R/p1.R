# Problem 1

# Sum of multiples of 5 or 3 below 1000


# attempt 1:
compute_s_i = function(a1, thresh){
  n = (thresh-1) %/% a1
  an = a1 * n
  s_i = (a1 + an) * n / 2
}

s_3 = compute_s_i(3, 1000)
s_5 = compute_s_i(5, 1000)
s_15 = compute_s_i(15, 1000)

res = s_3 + s_5 - s_15
