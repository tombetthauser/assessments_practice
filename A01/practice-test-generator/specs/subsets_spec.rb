describe '#subsets' do
  it "works for an empty array" do
    expect(subsets([])).to match_array([[]])
  end

  it "works for an array of one item" do
    expect(subsets([1])).to match_array([[], [1]])
  end

  it "returns all subsets of an array" do
    expect(subsets([1, 2, 3])).to match_array([[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]])
  end
end
