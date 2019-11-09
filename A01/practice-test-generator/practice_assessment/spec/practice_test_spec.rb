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

describe "#exponent" do
  it "returns the correct answer for positive exponents" do
    expect(exponent(5,3)).to eq(125)
  end

  it "returns the correct answer for negative exponents" do
    expect(exponent(2, -3)).to eq(1/8.0)
  end

  it "returns the correct answer when n is 0" do
    expect(exponent(2, 0)).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:exponent).at_least(:twice).and_call_original
    exponent(2, 3)
  end
end

describe "#doubler" do
  subject(:array) { [1, 2, 3] }

  it "doubles the elements of the array" do
    expect(doubler(array)).to eq([2, 4, 6])
  end

  it "does not modify the original array" do
    duped_array = array.dup
    doubler(array)
    
    expect(array).to eq(duped_array)
  end
end

describe '#longest_palindrome' do
  it 'returns false if there is no palindrome longer than two letters' do
    expect(longest_palindrome("palindrome")).to eq(false)
  end

  it 'returns the correct length of the palindrome' do
    expect(longest_palindrome("181847117432")).to eq(6)
  end

  it 'returns the correct length for the longest palindrome in the string' do
    expect(longest_palindrome("noonminimum")).to eq(5)
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

describe "Array#my_select" do
  let(:arr) { [1, 2, 3] }

  before(:each) do
    expect(arr).not_to receive(:select)
    expect(arr).not_to receive(:dup)
    expect(arr).not_to receive(:slice)
    expect_any_instance_of(Array).not_to receive(:select!)
    expect_any_instance_of(Array).not_to receive(:reject)
    expect_any_instance_of(Array).not_to receive(:reject!)
  end

  it "It correctly selects elements according to the passed in block" do
    expect(arr.my_select { |num| num > 1 }).to eq([2, 3])
  end

  it "It returns an empty array if there are no matches" do
    expect(arr.my_select { |num| num == 4 }).to eq([])
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

