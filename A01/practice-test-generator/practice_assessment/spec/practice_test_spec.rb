gem 'rspec'
require 'practice_test'
describe "#string_include_key" do
  it "returns true for the same string" do
    expect(string_include_key?("adblfci", "abc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 1" do
    expect(string_include_key?("adbblfci", "abbc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 2" do
    expect(string_include_key?("adbclfci", "abbc")).to eq(false)
  end

  it "returns false if the key characters are in the wrong order" do
    expect(string_include_key?("dblfcia", "abc")).to eq(false)
  end

  it "returns false if the string doesn't contain the key" do
    expect(string_include_key?("db", "abc")).to eq(false)
  end
end

describe "#factorials_rec" do
  it "returns first factorial number" do
    expect(factorials_rec(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials_rec(2)).to eq([1, 1])
  end

  it "returns many factorials numbers" do
    expect(factorials_rec(6)).to eq([1, 1, 2, 6, 24, 120])
  end

  it "calls itself recursively" do
    expect(self).to receive(:factorials_rec).at_least(:twice).and_call_original
    factorials_rec(6)
  end
end

describe "Array#my_zip" do
  let(:arr1) { [ 4, 5, 6 ] }
  let(:arr2) { [ 7, 8, 9 ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:zip)
  end 

  it "Zips arrays of the same size" do
    expect([1, 2, 3].my_zip(arr1, arr2)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "Zips arrays of differnet sizes and adds nil appropriately" do
    expect(arr1.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
  end

  let(:arr3) { [10, 11, 12] }
  let(:arr4) { [13, 14, 15] }

  it "Zips arrays with more elements than the original" do
    expect([1, 2].my_zip(arr1, arr2, arr3, arr4)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
    expect([].my_zip(arr1, arr2, arr3, arr4)).to eq([])
  end
end

describe "#titleize" do
  it "capitalizes a word" do
    expect(titleize("jaws")).to eq("Jaws")
  end

  it "capitalizes every word (aka title case)" do
    expect(titleize("david copperfield")).to eq("David Copperfield")
  end

  it "doesn't capitalize 'little words' in a title" do
    expect(titleize("war and peace")).to eq("War and Peace")
  end

  it "does capitalize 'little words' at the start of a title" do
    expect(titleize("the bridge over the river kwai")).to eq("The Bridge over the River Kwai")
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

describe "Array#my_quick_sort" do
  let(:array) { [1, 2, 3, 4, 5, 6, 7].shuffle }
  let(:sorted) { [1, 2, 3, 4, 5, 6, 7] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:sort)
    expect_any_instance_of(Array).not_to receive(:sort!)
    expect_any_instance_of(Array).not_to receive(:sort_by)
    expect_any_instance_of(Array).not_to receive(:sort_by!)
  end

  it "works with an empty array" do 
    expect([].my_quick_sort).to eq([])
  end

  it "works with an array of one number" do 
    expect([5].my_quick_sort).to eq([5])
  end

  it "sorts numbers" do
    expect(array.my_quick_sort).to eq(sorted)
  end

  it "sorts arrays with duplicates" do
    expect([17,10,10,9,3,3,2].my_quick_sort).to eq([2,3,3,9,10,10,17])
  end

  it "will use block if given" do
    reversed = array.my_quick_sort do |num1, num2|
      num2 <=> num1
    end
    expect(reversed).to eq([7, 6, 5, 4, 3, 2, 1])
  end
end

