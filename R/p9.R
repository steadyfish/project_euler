# Problem 9

# constraints
#1 a_2 + b_2 = c_2
#2 a + b + c = 1000
#3 a < b < c

# no of triplets satisfying #2 (includes duplicates)
# 1000 C 2
# ~10^6 (1000*1001)/2


library(gtools)
m_in = as.matrix(combinations(1000, 2))
m_in1 = cbind(m_in, 1000 - rowSums(m_in))
ind = which(m_in1[,3] > m_in1[,2] & m_in1[,2] > m_in1[,1])
m_in2 = m_in1[ind, ]
m_in3 = cbind(m_in2, m_in2[, 1]^2 + m_in2[, 2]^2, m_in2[, 3]^2)

op_ind = which(m_in3[, 4] == m_in3[, 5])
op_vec = m_in3[op_ind, 1:3]
op = prod(op_vec)
op