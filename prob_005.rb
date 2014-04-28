# 2520 is the smallest number that can be divided by each of the 
# numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible 
# by all of the numbers from 1 to 20?

# useful:
# http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

# time:  O(n*log(log(n)))
# space: O(n)
# stack: O(1)

# 0.05s user 
# 0.03s system 
# 65% cpu 
# 0.133 total

def find_primes(n)
  sieve = Hash.new(1)
  for i in (2..n)
    if sieve[i] >= 1
      sieve[i] = (n**(1.0/i)).floor
      (i**2).step(n, i) do |x| 
        sieve[x] = 0
      end
    end
  end
  primes = sieve.select { |n, v| v >= 1 }
  primes.keys.map { |prime| prime**sieve[prime]}
end

def least_common_multiple(n)
  find_primes(n).inject(:*)
end

puts least_common_multiple(20)
