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
