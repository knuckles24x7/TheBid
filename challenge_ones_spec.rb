# challenge_one_spec.rb
require "./bids"

describe "Accepted bids" do
  bids = Bids.new

  it "should be one" do
    bids.accept_bids("100, 49, 11, 9, 5, 2", 4).size.should eq(1)    
  end

  it "should be two" do
    bids.accept_bids("100,50,11,9,5,2", 4).size.should eq(2)	
  end

  it "should be four" do
    bids.accept_bids("100,80,70,65,50,45,5,2", 4).size.should eq(4)  
  end

  it "price point should be 50" do
    bids.accept_bids("100,50,11,9,5,2", 400).last.should eq(50)	
  end

  it "should be zero when no bids are given" do
  	bids.accept_bids(nil, 10).size.should eq(0)
  end

  it "should be zero when no servers are given" do
  	bids.accept_bids("10,9,8,7,6,5", nil).size.should eq(0)
  end  

  it "should be zero when the number of servers given is less than one" do
  	bids.accept_bids("10,9,8,7,6,5", 0).size.should eq(0)
  end  
end