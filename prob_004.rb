# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# There's an optimization for a reduction to O(0.5*n^2)
# But that's still O(n^2) so whatevs.

# Some people get fancy with 11's, but that's not an guarenteed solution
# as odd-digited palindromic numbers aren't products of 11.

# time:  O(n^2)
# space: O(1)
# stack: O(1)

# 0.27s user 
# 0.03s system 
# 86% cpu 
# 0.352 total

def brute_largest_palindrome_product(digits)
  min = 10**(digits-1)
  max = 10**(digits) - 1

  largest = 0

  i = min
  for i in (min..max)
    for j in (min..max)
      product = i*j
      largest = product if palindrome?(product) and product > largest
    end
  end
  largest
end

def palindrome?(number)
  num = number.to_s
  half = num.length/2
  num[0, half] == num[num.length-half, num.length].reverse
end

puts brute_largest_palindrome_product(3)
