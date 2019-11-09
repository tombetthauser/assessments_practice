describe "#permutations" do
  let(:arr) { [1, 2, 3] }
  let(:perms) { [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:permutation)
  end

  it "works for an empty array" do
    expect(permutations([])).to match_array([[]])
  end

  it "works for an array of one item" do
    expect(permutations([1])).to match_array([[1]])
  end
  
  it "returns all permutations of an array" do
    expect(permutations(arr)).to match_array(perms)
  end
end
