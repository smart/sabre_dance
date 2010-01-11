require 'spec_helper'

describe Photo do

  it "should create a new instance given valid attributes" do
    Factory(:photo).should be_valid
  end

end
