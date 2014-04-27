# time:  O(1)
# space: O(1)
# stack: O(1)

# 0.05s user 
# 0.03s system 
# 64% cpu 
# 0.134 total

def sum_of_sums(n)
  (n * (n + 1))/2
end

def sum_of_squares(n)
  (n * (n + 1) * (2 * n + 1))/6
end

def difference(n)
 sum_of_sums(n)**2 - sum_of_squares(n) 
end

puts difference(100)
