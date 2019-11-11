# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  return 1 if n == 0
  if n > 0
    b * exponent(b, n - 1)
  else
    1.0/b * exponent(b, n + 1)
  end
end

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return true if key.length == 0

  next_key_char = key.chars.first
  key_index = string.index(next_key_char)

  return false if key_index.nil?
  string_include_key?(string[key_index+1..-1], key[1..-1])
end

class Hash
  # Write a `Hash#my_merge(other_hash)` method. This should NOT modify the 
  # original hash and return a combined version of both hashes.
  # **Do NOT use the built-in `Hash#merge` method in your implementation.**
  
  def my_merge(other_hash)
    duped_hash = self.dup

    other_hash.each do |k, v|
      duped_hash[k] = v
    end

    duped_hash
  end
end

class String
  # Define a method `String#symmetric_substrings` that returns an array of 
  # substrings that are palindromes.  Only include substrings of length > 1.

  # example: "cool".symmetric_substrings => ["oo"]

  def symmetric_substrings
    symm_subs = []

    self.length.times do |start_pos|
      (2..(self.length - start_pos)).to_a.each do |end_pos|
        substr = self[start_pos...(start_pos + end_pos)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**
  
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_any?(&prc)` method. This method should return true if any
  # of the Array elements satisfy the block, otherwise it should return false.

  # Examples: 
  # `[1,2,3].my_any? { |n| n.even? }` => true
  # `[1,3,5].my_any? { |n| n.even? }` => false
  
  def my_any?(&prc)
    self.each { |el| return true if prc.call(el) }
    false
  end
end

class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.take(mid).my_bsearch(target)
    else
      search_res = self.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end
end

