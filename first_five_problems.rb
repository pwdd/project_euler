require 'prime'
# Problem 1 - Multiple of 3 and 5

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we 
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
def multiple_of_three_and_five(limit)
  (3...limit).select { |number| number % 3 == 0  || number % 5 ==0 }.inject(:+)
end

multiple_of_three_and_five(10)
# Problem 2 - Even Fibonacci numbers

# Each new term in the Fibonacci sequence is generated by adding the previous
# two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not 
# exceed four million, find the sum of the even-valued terms.

def even_fibonacci(limit)
  start = [1, 2]

  start << start.last(2).inject(:+) while start[-1] < limit

  start.select { |number| number.even? }.inject(:+)
end

even_fibonacci(4e6)

# Problem 3 - Largest prime factor

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def largest_prime(number)
  limit = Math.sqrt(number).floor  
  (2..limit).select { |n| number % n == 0 && Prime.prime?(n) }.max
end

largest_prime(600851475143)

# Problem 4 - Largest palindrome product

# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def largest_palindrome(min, max)
  products = []
  palindromes = []
  three_digits_comb = (min...max).to_a.combination(2)

  three_digits_comb.each do |comb|
    products << (comb[0] * comb[1]).to_s
  end

  products.each do |string|
    palindromes << string.to_i if string == string.reverse
  end

  palindromes.max
end

largest_palindrome(100, 1000)

# Problem 5 - Smallest multiple

# 2520 is the smallest number that can be divided by each of the numbers from 
# 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the 
# numbers from 1 to 20?

def smallest_multiple
  multiples = 1
  primes = Prime.entries 20

  primes.inject(1) { |memo, p| memo *= p ** max_power(p, 20) }
end

def max_power(number, limit)
  (2..limit).select { |n| number ** n < limit }.max || 1
end