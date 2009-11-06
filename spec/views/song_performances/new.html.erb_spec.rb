require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/song_performances/new.html.erb" do
  include SongPerformancesHelper
  
  before(:each) do
    assigns[:song_performance] = stub_model(SongPerformance,
      :new_record? => true
    )
  end

  it "renders new song_performance form" do
    render
    
    response.should have_tag("form[action=?][method=post]", song_performances_path) do
    end
  end
end


