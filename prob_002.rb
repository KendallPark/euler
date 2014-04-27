# Each new term in the Fibonacci sequence is generated by adding 
# the previous two terms. By starting with 1 and 2, the first 10 
# terms will be:

# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# highest fib # / 2

# By considering the terms in the Fibonacci sequence whose values 
# do not exceed four million, find the sum of the even-valued terms.

PHI = ((1 + Math.sqrt(5))*0.5)
MAGIC_NUM = 0.3277240618154451 # derived experimentally 

# useful: 
# http://en.wikipedia.org/wiki/Fibonacci_number
# http://en.wikipedia.org/wiki/Golden_ratio
# http://www.proofwiki.org/wiki/Sum_of_Sequence_of_Fibonacci_Numbers

# time:  O(1)
# space: O(1)
# stack: O(1)

# 0.06s user 
# 0.03s system 
# 65% cpu 
# 0.132 total


def fib(n)
  (PHI**n/Math.sqrt(5)).round
end

def highest_fib(x)
  n = get_n(x).floor
  return x if x == fib(n+1)
  fib(n)
end

def closest_fib(x)
  fib(get_n(x).round)
end

def previous_fib(x)
  (x/PHI).round
end

def log(n, base=10)
  Math.log(n, base)
end

def get_n(x)
  log(x, PHI) + 2.0 - MAGIC_NUM
end

def sum_of_evens(x)
  fib = highest_fib(x)
  until fib % 2 == 0
    fib = previous_fib(fib)
  end
  (fib(get_n(fib) + 2) - 1) / 2
end

def brute_sum_of_evens(x)
  sum = 0
  n = 1
  until fib(n) >= x
    sum += fib(n) if fib(n) % 2 == 0
    n += 1
  end
  sum
end

# puts brute_sum_of_evens(4*10**6)
puts sum_of_evens(4*10**6)
