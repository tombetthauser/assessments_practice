# Study Guide - Assessment Two


# Ruby Assessment 2 Learning Objectives

# Below are the learning objectives that Ruby Assessment 2 will test.
# Object Oriented Programming

#     Given a set of classes, some inheriting from others, correctly identify 
#       what methods an instance of each class has access to

"A child class inherits access to all of it's methods including attr_readers"
"attr_writers etc unless they are specifically over-writted by name or in a"
"protected / private class and called without proper specificity"

#     Given a parent and child class, correctly use the super method, passing 
#       only the necessary arguments, in the child class initialize method to 
#       handle shared initialization logic

"When a method instide a child class over-writes a method defined in it's parent"
"class it may optionally call super to make use of the parent method's functionality."
"This is most often seen in initialize where instance variables and arguments may be"
"added in addition to super. Important to note is that super called alone will"
"assume all new arguments passed into the child class's method. This can lead to"
"confusing argument errors, but can be avoided by specifically calling super()"
"which will indicated that no arguments should be passed in unless specified"
"as in super(arg1, arg2) which might ignore new additional arguments in the"
"child method call."

#     Implement a class inheritance chain using proper Ruby syntax

# class Parent
#   def initialize(name)
#     @name = name
#     @children = []
#   end
#   protected
#   def add_child(child)
#     @children << child
#   end
# end
# ....
# require_relative "parent.rb"

# class Child < Parent
#   def initialize(name, parent = nil)
#     super(name)
#     @parent = parent
#   end
#   def add_parent(parent)
#     @parent = parent
#     parent.add_child(self)
#   end
# end

#     Explain the difference between public, private, and protected methods

"Public methods are accessible both inside and outside an instance of a given 
  class. Private methods are only accessible within an instance of a givin class.
  Protected methods are accessible within an instance of a given class, but
  are also accessible to other instances of the same class."

  #~3min


"Public methods can be called anywhere inside or outside a class.

Private methods can only be called within a class and in cildren of that class 
if they are not called explicitly with self#method syntax.
  
Protected methods can only be called within a class and in children of that
class where they can be called with or without the explicit use of self#method
syntax."

#     Explain the difference between inheriting from a class and including a module

"When we define a class that inherits from another class the child class automatically
inherits all the methods form it's parent class. If we define an external module
we can import the methods from that module into any number of disticnt classes with
the syntax -include- followed by the name of the module. In both the cases of
inheritance and module includion we must use require_relative at the head of our
file before using syntax to include or inherit.

ie:"

class Parent
  def initialize(name)
    @name = name
  end

  def say_name
    p "Hi my name is #{name}!"
  end
end

module MyModule
  def add_parent(parent)
    @parent = parent
  end
end

# require_relative "parent.rb"
# require_relative "mymodule.rb"

class Child < Parent
  include MyModule

  def initialize(name)
    super(name)
    @parent = nil
  end
end

dan = Child.new("Dan")
tom = Parent.new("Tom")
dan.add_parent(tom)

# p dan

# ~8min



"Inheriting from a class grants the child access to all the methods included in the
parent class including initialize with the ability for specific instances of 
this class to be created. Modules are similar in structure to classes but specific 
instances of them cannot be created, rather they are included in classes so that
their methods can be included."

module Hello
  def hello
    p "Hello there, #{@name}!"
  end
end
#.....
# require_relative "hello.rb"
class Person
  include Hello
  def initialize(name)
    @name = name
  end
end
#.....
# tom = Person.new("Tom")
# tom.hello # => "Hello there, Tom!"




# Big O Analysis

#     Explain what "Big O" is and why we utilize it

"Big O is a way for us to distinguish between more and less optimized versions
of an algorithm or function. It describes the behavior of a particular function
in terms of the amount of time it takes to run or the amount of space it takes
up on a machine as it's inpute size approaches infinite."

#     Given an implementation of an algorithm, determine its Big O time complexity

#     Given a description of a problem (such as anagrams or two_sum), implement 

#       a solution that runs in linear time.




# Data Structures

#     Describe what LIFO and FIFO are and how they relate to the Stack and Queue ADTs, respectively

#     Describe the difference between an Abstract Data Type (ADT) and Data Structure

#     Given an ADT, identify what underlying data structures native to Ruby could be used to implement the ADT

#     Given a description of an algorithm, identify what ADTs would be useful in implementing a solution

#     Implement a Stack data structure

#     Implement a Queue data structure




# CSS

#     Given a pre-filled HTML skeleton, write CSS selectors to add specific styles 
#       to specific html tags, classes, and ids

#     Given an HTML skeleton, utilize the > selector in CSS to select all p elements 
#       that are children of the element with id index and give them all a font-size 
#       of 18px and background color of red (or any other basic CSS properties)

#     Use the :last-child selector to give the last item in an ordered list a color of green

#     Use the + selector to select the first sibling element of the h1 tag and give 
#       it a 1px solid black border





# Test Driven Development/RSpec

#     Describe at least 3 primary motivations for having automated test suites

#     Explain the difference between Unit Tests and Integration Tests

#     Describe the basic workflow of Test Driven Development

#     Explain the use case of a double or mock when writing unit tests

#     Describe the difference between RSpec's describe and context and when you should use each

#     Given an assertion, correctly set up an it block that uses expect to test for the assertion





# DFS

class Node

  def dfs(&prc)
    raise "must have proc" if prc.nil?
    return self if prc.call(self)

    self.children.each do |child|
      result = child.bfs(&prc)
      return result unless result.nil?
    end

    nil
  end

end

# BFS 

class Node

  def bfs(&prc)
    raise "must have proc" if proc.nil?

    queue = [self]

    until queue.empty?
      return self if prc.call(queue.shift)
      if self.children.length > 0
        self.children.each { |child| queue << child }
      end
    end

    nil
  end

end







# anagrams

def anagrams?(str1, str2)

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2

end

# p anagrams?("cat", "tac") # => true
# p anagrams?("cat", "tcafc") # => false

# ~2min



# two_sum

def okay_two_sum?(arr, target)
  hash = Hash.new
  arr.each do |ele|
    compliment = target - ele
    return true if hash[compliment]
    hash[ele] = true
  end
  false
end

# ~6min, ~3min, 1.5min, ~2min



# arr = [7,10,5,5,1]
# p okay_two_sum?(arr, 10) # => should be true
# p okay_two_sum?(arr, 1000) # => false




























##### FROM GARON


# Object Oriented Programming
# 1 Given a set of classes, some inheriting from others, correctly identify what methods an instance of each class has access to
# 2 Given a parent and child class, correctly use the super method, passing only the necessary arguments, in the child class initialize method to handle shared initialization logic
# 3 Implement a class inheritance chain using proper Ruby syntax
# 4 Explain the difference between public, private, and protected methods. #
# public
# From Ruby-Doc (on Access Control):
# Public methods can be called by anyone---there is no access control. Methods are public by default (except for initialize, which is always private).
# Note that as public is the default access level for methods, so in the example from the last section we didn't have to specify that #meow was public.
# private
# * private methods cannot be called with an explicit receiver. Because you cannot specify an object when using them, private methods can be called only in the defining class. ...
# If you have. A writer you have to call it with a receiver
# protected
# * Protected methods can be invoked only by objects of the defining class and its subclasses. Access is kept within the family.
# 5 Explain the difference between inheriting from a class and including a module
# 	Modules consist of methods that can be mixed in to a Ruby class.
# 	Any instance method or class method that is included in a module can be used in any class
# With inheritance you can only Inherit methods, or attributes from a hierarchy. So if you want to keep code cleaner, if you have a module that can be used in many classes it helps avoid redundancy.
#  modules do no contain any instance variables or anything that requires to be initialized
# module Greetable
#   def greet
#     "Hello, my name is #{self.name}"
#   end
# end
# class Human
#   include Greetable
#   def initialize(name)
#     @whyn07m3 = name
#   end
#   def name
#     @whyn07m3
#   end
# end
# class Robot
#   include Greetable
#   def name
#     "Robot Model #2000"
#   end
# end
# We "mix in" a module by using the #include method. This will take the methods defined in the module and make them available to instances of Robot and Human.
# Note that module methods may call methods of the class that they are mixed into. In this case, the Greetable module needs to access a name method. Both Robot and Human have name methods.
# Big O Analysis
# 1 Explain what "Big O" is and why we utilize it
# Big-O notation is a relative representation of the complexity of an algorithm.
# To optimize algorithm describe change in complexity of algorithm
# 0(n^2) { f | f does not dominate n^2}
# Belongs to a set of functions that does not dominate n2
# As n2/ n2 as n2 increases n/2 will not dominate n2
# Big 0 is asymptotic(remove constants) worst case runtime, measurability of scalability of algorithm
# In computer science, big O notation is used to classify algorithms according to how their running time or space requirements grow as the input size grows
# O(1)	:sunglasses:	Speed doesn't depend on the size of the dataset
# O(log n)	:grin:	10x the data means 2x more time
# O(n)	:confused:	10x the data means 10x more time
# O(n log n)	:confounded:	10x the data means about 20x more time
# O(n^2)	:tired_face:	10x the data take 100x more time
# O(2^n)	:scream:	The dilithium crystals are breaking up!
# 0(log n) - Binary search
# 0(n log n) -Merge sort, quick sort
# 0(n^2) nested loops, bubble sort
# 0(2^n) exponential, subsets
# 2 Given an implementation of an algorithm, determine its Big O time complexity
#   def print_first_item(items)
#   puts items[0]
# end
# This method runs in O(1) O(1) time (or "constant time") relative to its input. The input array could be 1 item or 1,000 items, but this method would still just require one "step."
#   def print_all_items(items)
#   items.each do |item|
#     puts item
#   end
# end
# This method runs in O(n) O(n) time (or "linear time"), where n
# n is the number of items in the array. If the array has 10 items, we have to print 10 times. If it has 1,000 items, we have to print 1,000 times.
#   def print_all_possible_ordered_pairs(items)
#   items.each do |first_item|
#     items.each do |second_item|
#       puts first_item, second_item
#     end
#   end
# Here we're nesting two loops. If our array has n n items, our outer loop runs nn times and our inner loop runs n
# n times for each iteration of the outer loop, giving us n^2
# nsquared total prints. Thus this method runs in O(n^2)
# ) time (or "quadratic time"). If the array has 10 items, we have to print 100 times. If it has 1,000 items, we have to print 1,000,000 times.
# This is why big O notation rules. When you're calculating the big O complexity of something, you just throw out the constants. So like:
#  def print_all_items_twice(items)
#   items.each do |item|
#     puts item
#   end
#   # once more, with feeling
#   items.each do |item|
#     puts item
#   end
# end
# This is O(2n)which we just call O(n)
#   def print_first_item_then_first_half_then_say_hi_100_times(items)
#   puts items[0]
#   middle_index = items.length / 2
#   index = 0
#   while index < middle_index
#     puts items[index]
#     index += 1
#   end
#   100.times do { puts "hi" }
# end
# This is O(1 + n/2 + 100), which we just call O(n)
# 3 Given a description of a problem (such as anagrams or two_sum), implement a solution that runs in linear time.
# Data Structures
# 1 . Describe what LIFO and FIFO are and how they relate to the Stack and Queue ADTs, respectively
# LIFO- Last in first out(push, pop) -used with a stack, lunch trays,
# FIFO- First in first out - queue(line) unshift, pop
# 2. Describe the difference between an Abstract Data Type (ADT) and Data Structure
# An array and a tree are two kinds of data structures. A data structure is a way of storing and organizing data in a computer so that it can be used efficiently. Depending on how you will use the data, different data structures may be appropriate.
# Abstract Data type (ADT) is a type (or class) for objects whose behaviour is defined by a set of value and a set of operations.
# * Given an ADT, identify what underlying data structures native to Ruby could be used to implement the ADT
# Stack - array
# Queue- array
# Set.- array, hash map
# * Given a description of an algorithm, identify what ADTs would be useful in implementing a solution
# * Implement a Stack data structure
# LIFO
# Use an array
# Push elements in
# Pop elements off
# PUSH POP
# # EXERCISE 1
# class Stack
#   def initialize
#     @underlying_array = []
#   end
#   def push(el)
#     underlying_array.push(el)
#     el
#   end
#   def pop
#     underlying_array.pop
#   end
#   def peek
#     underlying_array.last
#   end
#   private
#   attr_reader :underlying_array
# end
# * Implement a Queue data structure
# USE ARRAY
# PUSH, SHIFT
# FIFO
# Get first off by shifting, add elements by pushing
# # EXERCISE 2
# class Queue
#   def initialize
#     @underlying_array = []
#   end
#   def enqueue(el)
#     underlying_array.push(el)
#     el
#   end
#   def dequeue
#     underlying_array.shift
#   end
#   def peek
#     underlying_array.first
#   end
#   private
#   attr_reader :underlying_array
# end
# CSS
# * Given a pre-filled HTML skeleton, write CSS selectors to add specific styles to specific html tags, classes, and ids
# h1{
#   background: red;
# }
# .ingredients-list{
#   font-size: 50px;
#   background: green;
# }
# #ingredients{
#   font-family: fantasy;
# }
# *
# * Given an HTML skeleton, utilize the > selector in CSS to select all p elements that are children of the element with
# * id index and give them all a font-size of 18px and background color of red (or any other basic CSS properties)
# #description > p{
#   font-size: 18px;
#   background-color: red;
# }
# * Use the :last-child selector to give the last item in an ordered list a color of green
# /* header img:last-child {
#     width: 100px
# } */
# *
# * Use the + selector to select the first sibling element of the h1 tag and give it a 1px solid black border
# /* h2 + .user_review {
#   border-top: 100px solid black;
# } */
# *
# *
# Test Driven Development/RSpec
# * Describe at least 3 primary motivations for having automated test suites
# To make sure our code works
# It helps reduce our fear of breaking code, if we want to refactor something lets us know immediately if we have messed something up
# It helps with collaboration, you can work on someone else code
# Serves as a form of documentation if we writer our tests well we should know what each method is supposed to do
# * Explain the difference between Unit Tests and Integration Tests
# Unit tests - tests a particular class, particular thing, in isolation
# Integration tests- tests that different parts of our app are working together correctly, test two different classes to see if they are
# Communicating in the way we are expecting
# * Describe the basic workflow of Test Driven Development
# Red, Green, Refactor describes the proper TDD workflow.
# 1. Red: Write the tests and watch them fail (go red). It's important to ensure the tests initially fail so that you don't have false positives.
# 2. Green: Write the (minimum amount of) code to make the tests pass (go green).
# 3. Refactor: Refactor the code you just wrote. Your job is not over when the tests pass; you got it working, now make it clean.
# Generally, TDD developers keep their Red, Green, Refactor loop pretty tight. They'll write a few related tests, then implement the functionality, then refactor, then repeat. You keep the units small.
# * Explain the use case of a double or mock when writing unit tests
# using a test double allows you to test your code even when it relies on a class that is undefined or unavailable. 
# * Describe the difference between RSpec's describe and context and when you should use each
# In Rspec world, you often see people using both “describe” blocks and “context” blocks together, like this
# describe "launch the rocket" do
#   context "all ready" do
#   end
#   context "not ready" do
#   end
# end
# So what’s the difference between “describe” and “context” really?
# According to the rspec source code, “context” is just a alias method of “describe”, meaning that there is no functional difference between these two methods. However, there is a contextual difference that’ll help to make your tests more understandable by using both of them.
# The purpose of “describe” is to wrap a set of tests against one functionality while “context” is to wrap a set of tests against one functionality under the same state. Here’s an example
# describe "launch the rocket" do
#   before(:each) do
#     #prepare a rocket for all of the tests
#     @rocket = Rocket.new
#   end
#   context "all ready" do
#     before(:each) do
#       #under the state of ready
#       @rocket.ready = true
#     end
#     it "launch the rocket" do
#       @rocket.launch().should be_true
#     end
#   end
#   context "not ready" do
#     before(:each) do
#       #under the state of NOT ready
#       @rocket.ready = false
#     end
#     it "does not launch the rocket" do
#       @rocket.launch().should be_false
#     end
#   end
# end
# This code is more readable than wrapping all the stuffs with “describe” blocks. Because when you read the tests under “context”, you know they are all testing the same thing the “describe” talk about. And you know a “context” is to setup the state of your object, in this case @rocket.ready which will effects the behavior of @rocket.launch() that gives you a conclusion, right away, without scanning the code back and forth.
# * Given an assertion, correctly set up an it block that uses expect to test for the assertion
# describe Integer do
#   describe '#to_s' do
#     it 'returns string representations of integers' do
#       expect(5.to_s).to eq('5')
#     end
#   end
# end
# The block construction is necessary when you want to test that a certain method call will throw an error:
# describe '#sqrt' do
#   it 'throws an error if given a negative number' do
#     expect { sqrt(-3) }.to raise_error(ArgumentError)
#   end
# end

