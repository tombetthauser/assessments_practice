# Define a recursive method `permutations(array)` that returns all of the 
# permutations of an array

# example => permutations([1,2,3])
# should return => [
#  [1, 2, 3],
#  [1, 3, 2],
#  [2, 1, 3],
#  [2, 3, 1],
#  [3, 1, 2],
#  [3, 2, 1]
# ]

# You CANNOT use call Ruby's built-in `Array#permutation` method.

def permutations(array)
  return [array] if array.length <= 1

  # Similar to the subsets problem, we observe that to get the permutations of 
  # [1, 2, 3] we can look at the permutations of [1, 2] which are [1, 2] and 
  # [2, 1] and add the last element to every possible index getting [3, 1, 2], 
  # [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1], [2, 1, 3]

  # pop off the last element
  first = array.shift

  # make the recursive call
  perms = permutations(array)

  # we will need an array to store all our different permutations
  total_permutations = []

  # Now we iterate over the result of our recusive call say [[1, 2], [2, 1]]
  # and for each permutation add first into every index. This new subarray
  # gets added to total_permutations.
  perms.each do |perm|
    (0..perm.length).to_a.each do |i|
      total_permutations << perm[0...i] + [first] + perm[i..-1]
    end
  end

  total_permutations
end
