require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/song_performances/show.html.erb" do
  include SongPerformancesHelper
  before(:each) do
    assigns[:song_performance] = @song_performance = stub_model(SongPerformance)
  end

  it "renders attributes in <p>" do
    render
  end
end

