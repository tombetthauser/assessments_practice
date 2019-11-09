describe "Array#my_flatten" do
  let(:arr) { [1, 2, 3, [4, [5, 6]], [[[7]], 8]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it 'flattens arrays correctly' do
    expect(arr.my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'works on one dimensional arrays' do
    expect([1,2,3,4,5].my_flatten).to eq([1,2,3,4,5])
  end
end

describe "Array#my_controlled_flatten" do
  let(:arr) { [1,[2,3], [4,[5]], [[6,[7]]]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it "flattens an array the specified number of levels" do
    expect(arr.my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end

  it "returns a one dimensional array when invoked without an argument" do
    expect(arr.my_controlled_flatten).to eq([1, 2, 3, 4, 5, 6, 7])
  end

  it "works on one dimensional arrays" do
    expect([1,2,3,4,5].my_controlled_flatten).to eq([1,2,3,4,5])
  end
end
