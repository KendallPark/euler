# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

PRIMES = Hash.new(0)

# number of primes under any given n is ~ n^0.5/ln(n^0.5)

# I suspect that f(n) = lg(n) is the maximum number of prime factors
# for all integers n. Seeing that the smallest prime factor is 2.
# But I'm not going to write a fucking proof. By intuition. QED.

# useful:
# http://en.wikipedia.org/wiki/Prime_number
# http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

# time:  O(n^0.5) (worst case)
# space: O(log(n))
# stack: O(log(n))

# 0.05s user 
# 0.03s system 
# 64% cpu 
# 0.133 total

def largest_prime_factor(n)
  recursive_prime_factors(n)
  PRIMES.keys.sort().last
end

def recursive_prime_factors(n)
  divisor = 2
  while divisor <= n**0.5
    if n % divisor == 0
      PRIMES[divisor] += 1
      recursive_prime_factors(n/divisor)
      return
    end
    divisor += 1
  end
  PRIMES[n] += 1
end

def lg(n)
  Math.log(n, 2)
end

def add_prime(prime)
  PRIMES[prime] += 1
  PRIMES[:largest] = prime
end

def optimized_largest_prime_factor(n)
  optimized_recursive_prime_factors(2, n)
  PRIMES[:largest] || 1
end

def optimized_recursive_prime_factors(start, n)
  divisor = start # stuff underneath start has already been checked
  while divisor <= n**0.5
    if n % divisor == 0
      add_prime(divisor)
      next_divisor = n/divisor
      if (PRIMES[next_divisor] > 0) || (divisor > (next_divisor)**0.5)
        add_prime(next_divisor)
        return true
      else
        return true if optimized_recursive_prime_factors(divisor, next_divisor)
      end
    end
    divisor += 1
  end
end

# puts largest_prime_factor(600851475143)
puts optimized_largest_prime_factor(600851475143)
