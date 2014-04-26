# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

PRIMES = Hash.new(0)

# number of primes under any given n is ~ n^0.5/ln(n^0.5)

def largest_prime_factor(n)
  recursive_prime_factors(n)
  PRIMES.keys.sort().last
end

def recursive_prime_factors(n)
  divisor = 2
  while divisor < n**0.5
    if n % divisor == 0
      PRIMES[divisor] += 1
      recursive_prime_factors(n/divisor)
      return
    end
    divisor += 1
  end
  PRIMES[n] += 1
end

# wip

SIEVE = Hash.new(true)

def optimized_recursive_prime_factors(n)
  divisor = 2
  while divisor < n
    if SIEVE[divisor]
      (divisor**2).step(n**0.5, divisor) { |i| SIEVE[i] = false }
    end
    if n % divisor == 0
      PRIMES[divisor] += 1
      recursive_prime_factors(n/divisor)
      return
    end
    divisor += 1
  end
  PRIMES[n] += 1
  # FUTURE TAIL CALL HERE, Ruby may or may not optimize for it
  # but it's the thought that counts ;)
end

puts largest_prime_factor(600851475143)
