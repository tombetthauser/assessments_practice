require "byebug"

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