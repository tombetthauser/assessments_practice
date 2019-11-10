require "byebug"

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.

def first_even_numbers_sum(n)
  n < 1 ? n : (n*2) + first_even_numbers_sum(n-1)
end

# ~1.5min, 30sec

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
# the resulting number. Keep repeating until there is only one digit in the 
# result, called the "digital root". **Do NOT use the built in `Integer#to_s`
# or `Integer#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  digital_root(digital_root_step(num))
end

def digital_root_step(num)
  sum = 0
  num_copy = num
  while num_copy > 9
    sum += num_copy % 10
    num_copy = num_copy / 10
  end
  sum += num_copy
end

# ~9min (no solve issue - stupid singleton byebug problem??)

class Hash
  # Write a `Hash#my_merge(other_hash)` method. This should NOT modify the 
  # original hash and return a combined version of both hashes.
  # **Do NOT use the built-in `Hash#merge` method in your implementation.**
  
  def my_merge(other_hash)
    new_hash = {}
    self.keys.each { |key| new_hash[key] = self[key] }
    other_hash.keys.each { |key| new_hash[key] = other_hash[key] }
    new_hash
  end
end

#~3min

class String
  # Define a method `String#symmetric_substrings` that returns an array of 
  # substrings that are palindromes.  Only include substrings of length > 1.

  # example: "cool".symmetric_substrings => ["oo"]

  def symmetric_substrings
    subs = []
    (0...self.length).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        subs << self[idx1..idx2]
      end
    end
    subs.select { |sub| sub == sub.reverse }
  end
end

#~3min

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)

  end
end

class Array
  # Write an `Array#my_any?(&prc)` method. This method should return true if any
  # of the Array elements satisfy the block, otherwise it should return false.

  # Examples: 
  # `[1,2,3].my_any? { |n| n.even? }` => true
  # `[1,3,5].my_any? { |n| n.even? }` => false

  def my_any?(&prc)

  end
end

class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**
  
  def my_bsearch(target)
    
  end
end

