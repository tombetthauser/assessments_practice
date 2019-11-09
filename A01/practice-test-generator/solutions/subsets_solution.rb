# Write a recursive method `subsets(array)` that returns all of the subsets of 
# an array

# example => subsets([1,2,3])
# should return => [
#  [], 
#  [1], 
#  [2], 
#  [1, 2], 
#  [3], 
#  [1, 3], 
#  [2, 3], 
#  [1, 2, 3]
#  ]

def subsets(array)
  return [[]] if array.empty?

  subs = subsets(array[0..-2])
  subs.concat(subs.map{|el| el += [array.last]})
end
