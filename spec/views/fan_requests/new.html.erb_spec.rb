require 'spec_helper'

describe "/fan_requests/new.html.erb" do
  include FanRequestsHelper

  before(:each) do
    assigns[:fan_request] = stub_model(FanRequest,
      :new_record? => true
    )
  end

  it "renders new fan_request form" do
    render

    response.should have_tag("form[action=?][method=post]", fan_requests_path) do
    end
  end
end
