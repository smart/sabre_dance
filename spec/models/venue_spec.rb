require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Venue do


  it "should create a new instance given valid attributes" do
    Factory(:venue).should be_valid
  end

  describe "#find_or_create_from_pt_id" do

    it "should successfully create from a pt id" do
      #better to stub this in model

      house_dog = Factory(:venue)
      pt_id = 1356
      venue = Venue.find_or_create_by_pt_id(pt_id)
      venue.should be_valid
      venue.name.should == house_dog.name
    end
  end
end
