describe "Hash#my_each" do
  let(:a) { {"a"=> 1, "b" => 2, "c" => 3} }
  let(:res) { Array.new }

  before(:each) do
    expect(a).not_to receive(:each)
    expect(a).not_to receive(:dup)
    expect(a).not_to receive(:slice)
    expect_any_instance_of(Hash).not_to receive(:each_with_index)
    expect_any_instance_of(Hash).not_to receive(:map)
    expect_any_instance_of(Hash).not_to receive(:map!)
  end

  it "should call the proc on each key value pair" do
    a.my_each{ |key, v| v.times{res << key} }
    expect(res.sort).to eq(["a","b","b","c","c","c"])
  end

  it "should not modify the hash" do 
    a.my_each { |key, v| v.times { res << key } }
    expect(a).to eq({ "a"=> 1, "b" => 2, "c" => 3 })
  end

  it "should return the original hash" do 
    expect(a.my_each{ |key, v| v.times { res << key } }).to eq(a)
  end

  it "should be chainable" do 
    a.my_each do |k,v|
      v.times { res << k }
    end.my_each do |k,v|
      v.times { res << k }
    end
    expect(res).to eq(["a","b","b","c","c","c","a","b","b","c","c","c"])
  end 
end
