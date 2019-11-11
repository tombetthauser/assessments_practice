# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.

def fibs_sum(n)
  return n if n < 3
  fibs_sum(n - 1) + n
end

# ~ 2min

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
  digital_root(num / 10 + digital_root(num % 10))
end

# ~3min

class Array
  # Define a method `Array#my_rotate(positions)` that rotates the elements 
  # correctly based on the argument provided.  The work for positive and 
  # negative integer arguments.  You CANNOT use Ruby's `Array#rotate` or 
  # `Array#rotate!`.

  def my_rotate(positions = 1)
    dup = self.dup
    case positions <=> 0
    when 1
      positions.times { dup.push(dup.shift) }
    else
      positions.abs.times { dup.unshift(dup.pop) }
    end
    dup
  end  
end

# ~7min, 2min, 2min, 2min

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alpha = ("a".."z").to_a
  str.each_char.inject("") do |acc, char|
    if alpha.include?(char) 
      old_idx = alpha.index(char)
      acc += alpha[(old_idx + shift) % 26]
    else
      acc += char
    end
  end
end

# ~5min

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    (0...self.length).each do |idx|
      prc.call(self[idx])
    end
    self
  end
end

# ~30sec

class Array
  # Write an `Array#my_each_with_index(&prc)` method that calls a proc on each 
  # element with its index. **Do NOT use the built-in `Array#each`, `Array#map` 
  # or `Array#each_with_index` methods in your implementation.**

  def my_each_with_index(&prc)
    (0...self.length).each do |idx|
      prc.call(self[idx], idx)
    end
    self
  end
end

# ~1min

class Array
  # Write an Array method that returns a bubble-sorted copy of an array. 
  # Do NOT call the built-in `Array#sort` or `Array#sort_by` methods in 
  # your implementation. 
  
  def bubble_sort(&prc)
    prc ||= Proc.new { |x,y| x <=> y }
    arr = self.dup
    sorted = false
    until sorted
      sorted = true
      (0...arr.length-1).each do |idx|
        if prc.call(arr[idx], arr[idx+1]) > 0
          arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
          sorted = false
        end
      end
    end
    arr
  end

  # 5min

  # You are not required to implement this; it's here as a suggestion :-)
  # def bubble_sort!(&prc)
  # end
end
