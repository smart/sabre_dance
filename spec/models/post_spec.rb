require 'spec_helper'

describe Post do

  it "should create a new instance given valid attributes" do
    Factory(:post).should be_valid
  end
end
