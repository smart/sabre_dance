require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/song_performances/index.html.erb" do
  include SongPerformancesHelper
  
  before(:each) do
    assigns[:song_performances] = [
      stub_model(SongPerformance),
      stub_model(SongPerformance)
    ]
  end

  it "renders a list of song_performances" do
    render
  end
end

