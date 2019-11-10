gem 'rspec'
require 'practice_test'
# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.
describe '#first_even_numbers_sum' do
  it "returns the sum of the first even number" do
    expect(first_even_numbers_sum(1)).to eq(2)
  end

  it "returns the sum of the first n even numbers" do
    expect(first_even_numbers_sum(6)).to eq(42)
  end

  it "calls itself recursively" do
    expect(self).to receive(:first_even_numbers_sum).at_least(:twice).and_call_original
    first_even_numbers_sum(6)
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

describe "Hash#my_merge" do
  let(:hash1) { {a: 1, b: 2, c: 3} }
  let(:hash2) { {d: 4, e: 5} }
  let(:hash3) { {c: 33, d: 4, e: 5} }

  before(:each) do
    expect(hash1).not_to receive(:merge)
    expect(hash1).not_to receive(:merge!)
  end

  it "merges 2 hashes and returns a hash" do
    expect(hash1.my_merge(hash2)).to eq({ a: 1, b: 2, c: 3, d: 4, e: 5 })
  end

  it "prioritizes values from the hash being merged in" do
    expect(hash1.my_merge(hash3)).to eq({ a: 1, b: 2, c: 33, d: 4, e: 5 })
  end
end

describe "String#symmetric_substrings" do
  it "handles a simple example" do
    expect("aba".symmetric_substrings).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect("aba1cdc".symmetric_substrings).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect("xabax".symmetric_substrings).to match_array(["aba", "xabax"])
  end

  it "handles no symmetrical substrings" do
    expect("abcd".symmetric_substrings).to match_array([])
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

describe 'Array#my_any' do
  let(:arr) { [1,2,3] }

  before(:each) do
    expect(arr).not_to receive(:any?)
    expect(arr).not_to receive(:dup)
  end

  it "returns true if any number matches the block" do
    expect(arr.my_any? { |num| num > 2 }).to eq(true)
  end

  it "returns false if no elementes match the block" do
    expect(arr.my_any? { |num| num == 4 }).to eq(false)
  end
end

describe 'Array#my_bsearch' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  disallowed_methods = [
    :index, :find_index, :include?, :member?, :dup
  ]

  before(:each) do
    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end
    expect_any_instance_of(Array).not_to receive(:index)
  end

  it "returns nil if the array is empty" do
    expect([].my_bsearch(11)).to be_nil
  end

  it "returns the index of a target" do
    expect(arr.my_bsearch(33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(arr.my_bsearch(22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(arr.my_bsearch(66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    expect(arr.my_bsearch(5)).to be_nil
  end
end

