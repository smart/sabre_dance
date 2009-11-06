require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/index.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:shows] = [
      stub_model(Show),
      stub_model(Show)
    ]
  end

  it "renders a list of shows" do
    render
  end
end

