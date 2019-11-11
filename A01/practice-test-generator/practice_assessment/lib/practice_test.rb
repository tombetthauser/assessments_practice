# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  case n <=> 0
  when 0; 1
  when 1; b * exponent(b, n-1)
  else; 1 / b.to_f * exponent(b, n+1)
  end
end

#~3min

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return key == "" if string == ""
  if string[-1] == key[-1]
    string_include_key?(string[0...-1], key[0...-1])
  else
    string_include_key?(string[0...-1], key)
  end
end

# 5min

class Hash
  # Write a `Hash#my_merge(other_hash)` method. This should NOT modify the 
  # original hash and return a combined version of both hashes.
  # **Do NOT use the built-in `Hash#merge` method in your implementation.**
  
  def my_merge(other_hash)
    hash = {}
    self.keys.each { |k| hash[k] = self[k] }
    other_hash.keys.each { |k| hash[k] = other_hash[k] }
    hash
  end
end

# 4min

class String
  # Define a method `String#symmetric_substrings` that returns an array of 
  # substrings that are palindromes.  Only include substrings of length > 1.

  # example: "cool".symmetric_substrings => ["oo"]

  def symmetric_substrings
    subs = []
    (0...self.length).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        sub = self[idx1..idx2]
        subs << sub if sub == sub.reverse
      end
    end
    subs
  end
end

# 5min

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    (0...self.length).each { |idx| prc.call(self[idx]) }; self
  end
end

#1.5

class Array
  # Write an `Array#my_any?(&prc)` method. This method should return true if any
  # of the Array elements satisfy the block, otherwise it should return false.

  # Examples: 
  # `[1,2,3].my_any? { |n| n.even? }` => true
  # `[1,3,5].my_any? { |n| n.even? }` => false

  def my_any?(&prc)
    (0...self.length).each { |idx| return true if prc.call(self[idx]) }; false
  end
end

# 2min

class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**
  
  def my_bsearch(target)
    return nil if self.empty?
    return 0 if self.first == target

    mid = self.length / 2
    left = self[0...mid]
    right = self[mid...self.length]
    
    return mid if self[mid] == target

    if target < self[mid]
      left.my_bsearch(target)
    else
      mid + right.my_bsearch(target)
    end
  end
end

# ~5min

