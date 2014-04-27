# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

# Some ideas...

# Number theory could have some cool tricks. Also, logs

# This is very base 10-ish

# The check for a palindrome is O(1)

# Brute force would iterate through ALL possible multiples 
# between 100 and 999 O(n^2)

# That's a 1000 x 1000 matrix!

# Perhaps working backwards... which is larger, the number of 
# palindromic numbers or the number of possible products?

# What is n again? The range.

# Memoization? If x isn't palindromic, it follows that y, and z
# won't be...
