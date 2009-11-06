require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tour do

  it "should create a new instance given valid attributes" do
    Factory(:tour).should be_valid
  end

  describe "#find_or_create_from_pt_id" do

    it "should successfully create from pt id" do
     #better to stub this in model
      house_dog = Factory(:tour)
      pt_id = 39
      tour = Tour.find_or_create_by_pt_id(pt_id)
      tour.should be_valid
      tour.name.should == house_dog.name
    end


  end
end
