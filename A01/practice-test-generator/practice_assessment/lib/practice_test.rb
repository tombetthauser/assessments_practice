require "byebug"

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(string, key)
  return true if string == key
  return false if string.length == 0 || key.length == 0
  if string[0] == key[0]
    string_include_key?(string[1..-1], key[1..-1])
  else
    string_include_key?(string[1..-1], key)
  end
end

# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  
end

class Array
  # Define a method `Array#my_zip(*arrays)` that merges elements from the 
  # receiver with the corresponding elements from each provided argument. You 
  # CANNOT use Ruby's built-in `Array#zip` method

  # example => [1,2,3].my_zip([4,5,6], [7,8,9]) 
  # should return => [[1,4,7], [2,5,8], [3,6,9]]

  def my_zip(*arrays)

  end
end

# Define a method `titleize(title)` that capitalizes each word in a string like 
# a book title.  First word in a title should always be capitalized.  Do not 
# capitalize words like 'a', 'and', 'of', 'over' or 'the'.

def titleize(title)
  
end

class Array
  # Write an `Array#my_each(&prc)` method that calls a proc on each element.
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index`, or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)

  end
end

class Array
  # Define a method `Array#my_select(&prc)` that correctly returns an array of 
  # selected elements according to the block. **Do NOT use the built-in 
  # `Array#select` or `Array#reject` in your implementation.**

  def my_select(&prc)
    
  end  
end

class Array
  # Define a method `Array#quick_sort` that implements the quick sort method. 
  # The method should be able to accept a block. **Do NOT use the built-in
  # `Array#sort` or `Array#sort_by` methods in your implementation.**

  def my_quick_sort(&prc)

  end  
end

