describe "Array#my_join" do
  let(:array) { [ "a", "b", "c", "d" ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:join)
  end

  it "joins an array if no argument is passed" do
    expect(array.my_join).to eq("abcd")
  end

  it "joins an array if an argument is passed" do
    expect(array.my_join("$")).to eq("a$b$c$d")
  end
end
