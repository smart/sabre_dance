require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tours/show.html.erb" do
  include ToursHelper
  before(:each) do
    assigns[:tour] = @tour = stub_model(Tour)
  end

  it "renders attributes in <p>" do
    render
  end
end

