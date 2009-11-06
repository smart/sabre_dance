require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/show.html.erb" do
  include ShowsHelper
  before(:each) do
    assigns[:show] = @show = stub_model(Show)
  end

  it "renders attributes in <p>" do
    render
  end
end

