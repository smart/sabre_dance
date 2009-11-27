require 'spec_helper'

describe "/fan_requests/index.html.erb" do
  include FanRequestsHelper

  before(:each) do
    assigns[:fan_requests] = [
      stub_model(FanRequest),
      stub_model(FanRequest)
    ]
  end

  it "renders a list of fan_requests" do
    render
  end
end
