require 'spec_helper'

describe FanRequest do

  it "should create a new instance given valid attributes" do
    Factory(:fan_request).should be_valid
  end
end
