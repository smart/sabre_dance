require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tours/index.html.erb" do
  include ToursHelper
  
  before(:each) do
    assigns[:tours] = [
      stub_model(Tour),
      stub_model(Tour)
    ]
  end

  it "renders a list of tours" do
    render
  end
end

