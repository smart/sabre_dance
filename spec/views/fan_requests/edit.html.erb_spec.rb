require 'spec_helper'

describe "/fan_requests/edit.html.erb" do
  include FanRequestsHelper

  before(:each) do
    assigns[:fan_request] = @fan_request = stub_model(FanRequest,
      :new_record? => false
    )
  end

  it "renders the edit fan_request form" do
    render

    response.should have_tag("form[action=#{fan_request_path(@fan_request)}][method=post]") do
    end
  end
end
