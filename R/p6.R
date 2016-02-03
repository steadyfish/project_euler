# Problem 6
# the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

num = 1:100
s1 = num %*% t(num)
s2 = num * num
ss1 = sum(s1)
ss2 = sum(s2)

ss = ss1 - ss2
