# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.

# What is the 10,001st prime number?

# helpful:
# http://en.wikipedia.org/wiki/Prime_counting_function
# http://en.wikipedia.org/wiki/Lambert_W_function#Numerical_evaluation
# http://code.activestate.com/recipes/577729-lambert-w-function/
# http://www.whim.org/nebula/math/lambertw.html
# http://perso-laris.univ-angers.fr/~chapeau/papers/lambertw.pdf

def approx_array_size_need(n)
  Math::E**(-w_1(-(1.0/n)))
end

def power_tower(a)
  x1 = Math.log(a) / w0(Math.log(a))
  x2 = Math::E**(w0(Math.log(a)))
  puts "x^x = #{a}"
  puts "#{x1}^#{x2} = #{x1**x2}"
end

def ln(x)
  Math.log(x, Math::E)
end

def w0(x)
  e = Math::E
  eps = 0.00000001 # max error
  if x > 10
    w = Math.log(x) - Math.log(Math.log(x))
  elsif (0 <= x) && (x <= 10) 
    w = 0
  elsif (-1.0/e <= x) && (x < 0)
    w = 0
  end
  while true
    ew = e**w
    w_new = w - (w * ew - x)/(w * ew + ew)
    break if (w - w_new).abs <= eps
    w = w_new
  end
  w
end

def w_1(x)
  puts x
  e = Math::E
  if (-1.0/e <= x) && (x <= -0.333)
    p = -(2*(e*x+1))**0.5
    w = -1 + p - (1.0/3)*p**2 + (11.0/72)*p**3 - (43.0/540)*p**4 + (769.0/17280)*p**5 - (221.0/8505)*p**6
  elsif (-0.333 <= x) && (x <= -0.033)
    w = (-8.0960 + 391.0025*x - 47.4252*x**2 - 4877.6330*x**3 - 5532.7760*x**4) / (1 - 82.9423*x + 433.8688*x**2 + 1515.3060*x**3)
  elsif (-0.033 <= x) && (x <= 0)
    l1 = ln(-x)
    l2 = ln(-ln(-x))
    w = l1 - l2 + l2/l1 + ((-2 + l2)*l2)/(2*l1**2) + ((6 - 9*l2 + 2*l2**2)*l2)/(6*l1**3) + ((-12 + 36*l2 - 22*l2**2 + 3*l2**3)*l2)/(12*l1**4) + ((60 - 300*l2 + 350*l2**2 - 125*l2**3 + 12*l2**4)*l2)/(60*l1**5)
  end
  w
end

puts approx_array_size_need(1000)

# should be -3.57715
# puts w_1(-0.1)

# power_tower(3)
