require 'spec_helper'

describe Sequence do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Sequence.create!(@valid_attributes)
  end
end
