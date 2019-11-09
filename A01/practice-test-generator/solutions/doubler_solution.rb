# Write a method that doubles each element in an array. Assume all elements of
# the array are integers.

def doubler(array)
  array.map { |num| num * 2 }
end
