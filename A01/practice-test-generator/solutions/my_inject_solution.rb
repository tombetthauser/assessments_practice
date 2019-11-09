class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**
  
  def my_inject(accumulator = nil, &prc)
    arr = self

    if accumulator.nil?
      accumulator = self.first
      arr = self.drop(1)
    end

    arr.each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end
end
