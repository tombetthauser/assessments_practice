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

class Parent
  def initialize(name)
    @name = name
    @children = []
  end
  protected
  def add_child(child)
    @children << child
  end
end
# ....
require_relative "parent.rb"

class Child < Parent
  def initialize(name, parent = nil)
    super(name)
    @parent = parent
  end
  def add_parent(parent)
    @parent = parent
    parent.add_child(self)
  end
end

#     Explain the difference between public, private, and protected methods

"Public methods can be called anywhere inside or outside a class.

Private methods can only be called within a class and in cildren of that class 
if they are not called explicitly with self#method syntax.
  
Protected methods can only be called within a class and in children of that
class where they can be called with or without the explicit use of self#method
syntax."

#     Explain the difference between inheriting from a class and including a module

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
require_relative "hello.rb"
class Person
  include Hello
  def initialize(name)
    @name = name
  end
end
#.....
tom = Person.new("Tom")
tom.hello # => "Hello there, Tom!"




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
