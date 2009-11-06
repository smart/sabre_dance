require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  before(:each) do

  end

  it "should create a new instance given valid attributes" do
    Factory(:song).should be_valid
  end

  describe "#create_from_pt_id" do

    it "should be able to create a valid model from pt id" do
       song = Song.create_by_pt_id(37)
      house_dog = Factory(:song, :pt_id => 300)
      song.should be_valid
      song.name.should == house_dog.name
    end

  end

end
