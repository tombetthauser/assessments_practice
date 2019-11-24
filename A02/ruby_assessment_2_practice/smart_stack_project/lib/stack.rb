class Stack

  def initialize()
    @underlying_array = []
  end
  
  def size
    @underlying_array.count
  end

  def empty?
    @underlying_array.length == 0
  end

  def top
    @underlying_array.last
  end

  def peek(n)
    @underlying_array[-n..-1]
  end

  def push(item)
    @underlying_array << item
    self.size
  end

  def pop
    return nil if self.size == 0
    @underlying_array.pop
  end
  
end