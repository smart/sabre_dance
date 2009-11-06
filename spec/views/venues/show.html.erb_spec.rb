require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/show.html.erb" do
  include VenuesHelper
  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue)
  end

  it "renders attributes in <p>" do
    render
  end
end

