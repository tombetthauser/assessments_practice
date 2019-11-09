require "byebug"

# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  return n if n < 3
  n + fibs_sum(n-1)
end

# 4min --- practice more







# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  return 1 if n == 0
  n > 0 ? b * exponent(b, n-1) : 1.0 / b * exponent(b, n+1)
end

# 5+ min --- practice more










# Write a method that doubles each element in an array. Assume all elements of
# the array are integers.

def doubler(array)
  array.map { |el| el * 2 }
end










# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  subs = []
  (0...string.length).each do |idx1|
    (idx1+1...string.length).each do |idx2|
      subs << string[idx1..idx2]
    end
  end
  pal_subs = subs.select { |sub| sub == sub.reverse }
  longest = pal_subs.inject { |acc, sub| sub.length >= acc.length ? sub : acc }

  return false if longest.nil?
  longest.length > 2 ? longest.length : false
end

# ~10min (buggy - tired)
# PRACTICE MORE <~~~~~~~











class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    (0...self.length).each { |idx| prc.call(self[idx]) }
    self
  end
end

# ~2min(super tired)

class Array
  # Define a method `Array#my_select(&prc)` that correctly returns an array of 
  # selected elements according to the block. **Do NOT use the built-in 
  # `Array#select` or `Array#reject` in your implementation.**

  def my_select(&prc)
    self.inject([]) { |acc, ele| prc.call(ele) ? acc += [ele] : acc }
  end  
end

# ~1min(super tired)









class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in `Array#sort` or `Array#sort_by` methods in 
  # your implementation. 
  
  def bubble_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }

    shmelf = self.dup

    sorted = false
    until sorted
      sorted = true
      (0...shmelf.length-1).each do |idx|
        if prc.call(shmelf[idx], shmelf[idx+1]) > 0
          shmelf[idx], shmelf[idx+1] = shmelf[idx+1], shmelf[idx]
          sorted = false
        end
      end
    end
    shmelf
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
  end
end

