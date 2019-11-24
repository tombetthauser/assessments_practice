require "byebug"
require_relative "stack.rb"

class SmartStack < Stack

  def initialize(num)
    @max_size = num
    @underlying_array = []
  end

  def max_size
    @max_size
  end

  def full?
    @underlying_array.length >= @max_size
  end

  def push(*args)
    raise "stack is full" if @underlying_array.length + args.length > @max_size
    args.each { |el| @underlying_array << el }
    @underlying_array.length
  end

  def pop(num = 1)
    if num > @underlying_array.length
      @underlying_array.unshift(nil) until @underlying_array.length == num 
    end
    @underlying_array.pop(num).reverse
  end

end