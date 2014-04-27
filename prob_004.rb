# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

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
  (min..max).each do |i|
    (min..(max - i + 1)).each do |j|
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
