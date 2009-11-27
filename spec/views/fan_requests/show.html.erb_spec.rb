require 'spec_helper'

describe "/fan_requests/show.html.erb" do
  include FanRequestsHelper
  before(:each) do
    assigns[:fan_request] = @fan_request = stub_model(FanRequest)
  end

  it "renders attributes in <p>" do
    render
  end
end
