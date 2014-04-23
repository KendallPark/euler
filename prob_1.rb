# If we list all the natural numbers below 10 that are multiples of 3 or 5
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

# Complexity: O(1)

# 0.05s user 
# 0.03s system 
# 65% cpu 
# 0.130 total

def sum_of_sums(n)
  (n * (n + 1))/2
end

puts 3 * sum_of_sums(999 / 3) + 5 * sum_of_sums(999 / 5) - 15 * sum_of_sums(999 / 15)

