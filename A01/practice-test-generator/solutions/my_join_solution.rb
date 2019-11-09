class Array
  # Write an `Array#my_join` method. If my_join receives no argument, then use
  # an empty string to join the array together.
  # **Do NOT use the built-in `Array#join` method in your implementation.**
  #
  # Examples.
  # `[1,2,3].my_join` => '123'
  # `[1,2,3].my_join('$')` => '1$2$3'

  def my_join(separator = "")
    joined_str = ""
    i = 0
    self.each do |el|
      joined_str << el.to_s
      joined_str << separator unless i == self.length - 1 
      i += 1
    end

    joined_str
  end
end
