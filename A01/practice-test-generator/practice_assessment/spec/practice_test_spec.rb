gem 'rspec'
require 'practice_test'
describe '#fibs_sum' do
  it 'returns the sum of the first fibonacci number' do
    expect(fibs_sum(1)).to eq(1)
  end

  it 'returns the sum of the first 2 fibonacci numbers' do
    expect(fibs_sum(2)).to eq(2)
  end

  it 'returns the sum of the first 6 fibonacci numbers' do
    expect(fibs_sum(6)).to eq(20)
  end

  it "calls itself recursively" do 
    expect(self).to receive(:fibs_sum).at_least(:twice).and_call_original
    fibs_sum(6)
  end
end

describe "#digital_root" do
  before(:each) do
    expect_any_instance_of(Integer).to_not receive(:to_s)
    expect_any_instance_of(Integer).to_not receive(:digits)
  end
  
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a multi-digit number" do
    expect(digital_root(125)).to eq(8)
  end
  
  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
  end
end

describe "Array#my_rotate" do
  let(:arr) {[ "a", "b", "c", "d" ]}

  before (:each) do
    expect_any_instance_of(Array).not_to receive(:rotate)
    expect_any_instance_of(Array).not_to receive(:rotate!)
  end
  
  it "Rotates the elements 1 position if no argument is passed in" do
    expect(arr.my_rotate).to eq(["b", "c", "d", "a"])
  end
  
  it "Rotates the elements correctly if an argument is passed in" do
    expect(arr.my_rotate(2)).to eq(["c", "d", "a", "b"])
  end

  it "Rotates the elements correctly if a negative argument is passed in" do
    expect(arr.my_rotate(-3)).to eq(["b", "c", "d", "a"])
  end

  it "Rotates the elements correctly for a large argument" do
    expect(arr.my_rotate(15)).to eq(["d", "a", "b", "c"])
  end
end

describe "#caesar_cipher" do
  it "encodes a simple word" do
    expect(caesar_cipher("aaa", 11)).to eq("lll")
  end

  it "wraps around the alphabet" do
    expect(caesar_cipher("zzz", 1)).to eq("aaa")
  end

  it "encodes multiple words" do
    expect(caesar_cipher("catz hatz", 2)).to eq("ecvb jcvb")
  end
end

describe "Array#my_each" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }

  before(:each) do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:map)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:each_with_index)
    expect_any_instance_of(Array).not_to receive(:map!)
  end

  it "works for blocks" do
    arr.my_each { |el| res << 2 * el }
    expect(res).to eq([2,4,6])
  end

  it "does not modify original array" do 
    arr.my_each { |el| res << 2 * el }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each { |el| el } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each do |el| 
      res << 2 * el
    end.my_each do |el|
      res << 3 * el 
    end

    expect(res).to eq([2,4,6,3,6,9])
  end
end

describe "Array#my_each_with_index" do
  let(:arr) { [1,2,3] }
  let(:res) { Array.new }

  before(:each) do
    expect(arr).not_to receive(:each)
    expect(arr).not_to receive(:map)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:each_with_index)
    expect_any_instance_of(Array).not_to receive(:map!)
  end

  it "works for blocks that use both the index and element" do
    arr.my_each_with_index { |el, i| res << 2 * el + i }
    expect(res).to eq([2,5,8])
  end

  it "does not modify the original array" do 
    arr.my_each_with_index { |el, i| res << el * 2 + i }
    expect(arr).to eq([1,2,3])
  end

  it "should return the original array" do 
    return_val = arr.my_each_with_index { |el, i| el + i } 
    expect(return_val).to eq(arr)
  end

  it "should be chainable" do 
    arr.my_each_with_index do |el, i|
      res << el * 2 + i 
    end.my_each_with_index do |el, i|
      res << el * 2 + i 
    end

    expect(res).to eq([2,5,8,2,5,8])
  end
end

describe "Array#bubble_sort" do
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do
    expect([].bubble_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].bubble_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.bubble_sort).to eq([1, 2, 3, 4, 5])
  end

  it "will use block if given" do
    sorted = array.bubble_sort do |num1, num2|
      # order numbers based on descending sort of their squares
      num2**2 <=> num1**2
    end

    expect(sorted).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.bubble_sort
    expect(duped_array).to eq(array)
  end
end

