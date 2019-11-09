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
