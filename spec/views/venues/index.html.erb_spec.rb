require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/index.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venues] = [
      stub_model(Venue),
      stub_model(Venue)
    ]
  end

  it "renders a list of venues" do
    render
  end
end

