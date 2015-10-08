require 'rspec'
require 'execution-time'

describe "#my_min" do

  it "returns the smallest number" do
    expect(my_min_p1([1, 5, -6, 2 , 0] )).to eq(-6)
  end

  it "returns the smallest number" do
    expect(my_min_p2([1, 5, -6, 2 , 0] )).to eq(-6)
  end

end
