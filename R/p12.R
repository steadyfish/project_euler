# Problem 12

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# first triangular number with 100+ divisors

library(magrittr)

get_nth_triangle_num = function(n){
  out = n * (n + 1) / 2
  return(out)
}

get_no_of_divisors = function(num){
  out = ((num %% 1:num) == 0) %>% 
    sum
  return(out)
}

get_1st_triangle_num_with_n_divisors = function(no_divisors, fac = 5, type = "linear", block_size = 1000){
  if(type == "linear"){
    initial_guess = 0
    offset = 0
    while(1 == 1){
      initial_guess = initial_guess + offset*block_size + 1
      range = initial_guess:(initial_guess + block_size)
      triangle_num = as.matrix(get_nth_triangle_num(range))
      no_divisors_op = apply(triangle_num, 1, get_no_of_divisors) 
      ind = no_divisors_op > no_divisors
      if(sum(ind) > 1){
        op = cbind(no_divisors_op[ind], triangle_num[ind], range[which(ind==TRUE)])
        op1 = op[which.min(op[2]),]
        return(op)
      }else{
        offset = offset + 1
      }
    } 
    
  }else if(type != "linear"){
  initial_guess = (no_divisors * fac) %>% sqrt %>% floor
  
  # random jumps
  while(op[1] < 100) {
    triangle_num = get_nth_triangle_num(initial_guess:(initial_guess + 2))
    no_divisors_op = apply(as.matrix(triangle_num), 1, get_no_of_divisors) 
    
    op = cbind(max(no_divisors_op), triangle_num[which.max(no_divisors_op)])
    
    # assuming no of divisors increaseat the same rate in general
    if(op[1] < no_divisors){
      initial_guess = floor(initial_guess * (no_divisors / op[1]))
    }
    if(op[1] > no_divisors){
      initial_guess = floor(initial_guess * (no_divisors / op[1]))
    }
  }
  
  return(op)
  }
}


out = get_1st_triangle_num_with_n_divisors(10, block_size = 100)
