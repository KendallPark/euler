# If we list all the natural numbers below 10 that are multiples of 3 or 5
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

# time:  O(1)
# space: O(1)

# 0.05s user 
# 0.03s system 
# 65% cpu 
# 0.130 total

def sum_of_sums(n)
  (n * (n + 1))/2
end

def sum_of_two_multiples(a, b, max)
  a * sum_of_sums((max-1) / a) + b * sum_of_sums((max-1) / b) - (a*b) * sum_of_sums((max-1) / (a*b))
end

def brute_sum_of_two_multiples(a, b, max)
  ((1...max).select { |x| x % a == 0 || x % b == 0 }).inject(:+)
end

#puts brute_sum_of_two_multiples(3, 5, 10**8)
puts sum_of_two_multiples(3, 5, 10**8)
