# Write a function `anagrams(str1, str2)` that takes in two words and returns a 
# boolean indicating whether or not the words are anagrams. Anagrams are words 
# that contain the same characters but not necessarily in the same order. Solve 
# this without using `Array#sort` or `Array#sort_by`.

def anagrams(str1, str2)
  letters = Hash.new(0)

  str1.split('').each do |char|
    letters[char] += 1
  end

  str2.split('').each do |char|
    letters[char] -= 1
  end

  letters.all? { |_, v| v.zero? }
end
