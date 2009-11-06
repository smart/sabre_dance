require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/song_performances/edit.html.erb" do
  include SongPerformancesHelper
  
  before(:each) do
    assigns[:song_performance] = @song_performance = stub_model(SongPerformance,
      :new_record? => false
    )
  end

  it "renders the edit song_performance form" do
    render
    
    response.should have_tag("form[action=#{song_performance_path(@song_performance)}][method=post]") do
    end
  end
end


