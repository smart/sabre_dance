require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/songs/show.html.erb" do
  include SongsHelper
  before(:each) do
    assigns[:song] = @song = stub_model(Song)
  end

  it "renders attributes in <p>" do
    render
  end
end

