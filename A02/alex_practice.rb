# Which data structure would be the more preferable to keep track of 
# visited nodes when implementing a BFS on a graph? A Set or an Array.
# EXPLAIN YUOR ASS HOLE

# What is a difference between "private" and "protected" methods?


class Animal 

  def initialize(name, *foods)
    @name = name
    @foods = foods
  end

  protected

  def print_food
    p "Hi"
  end
end

class Kitty < Animal

  def initialize(name, *foods)
    super
  end

  def call_food
    self.print_food
  end
end

pogo = Kitty.new("Pogo", "cat food", "pizza")
wendel = Kitty.new("Wendel", "rats", "dog food", "crackers")

pogo.call_food




# def log_of_n(num)
#   while num >= 1
#     puts num
#     num = num / 2
#   end
# end

# log_of_n(100)
# puts; puts
# log_of_n(100000)
# puts; puts
# log_of_n(1000000000000)
# puts; puts
# log_of_n(10000000000000000000000000000000000000000000000000)