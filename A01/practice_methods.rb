require "byebug"




















p "we will all burn in the fire of innumerable suns as the universe expands and contract cyclically towards its own inevitable beginning".split(" ").shuffle.join(" ").capitalize + "."

# we burn beginnings cyclically
# contract the inummerable suns
#         inevitable universe
#               own the will
















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

    return mid if right.first == 0

    if target < right.first
      left.my_bsearch(target)
    else
      mid + right.my_bsearch(target)
    end

  end
end

# ~1.5min, 10+min(had to look it up), 8min, 6.5min, 3min


















# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.

def exponent(b, n)
  return 1 if n == 0
  if n < 0
    1.0 / b * exponent(b, n + 1)
  else 
    b * exponent(b, n - 1)
  end
end

#moved on after ~5min
# PRACTICE MORE <~~~~~~~~~~






# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  n < 2 ? n : 1 + fibs_sum(n - 1) + fibs_sum(n - 2)
end

# moved on after 5min
# PRACTICE MORE <~~~~~~~~~~







class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use `Array#sort` or `Array#sort_by` in your implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if self.count < 2
    
    mid = self.length / 2
    sorted_left = self[0...mid].merge_sort(&prc)
    sorted_right = self[mid..-1].merge_sort(&prc)
    
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

# moved on after ~8min
# PRACTICE MORE <~~~~~~~~~~



# took about 30min overall -- 27 total -- 5 specs missed -- 22 / 25 correct
# 88% -- good enough but continue practicing








def gamma_fnc(n)
  return 1 if n == 1
  return nil if n == 0
  # return nil if n <= 0
  a = n-1
  a * gamma_fnc(a-1) 
  
  # a * gamma_fnc(a-1)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040