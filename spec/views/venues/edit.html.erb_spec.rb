require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/edit.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue,
      :new_record? => false
    )
  end

  it "renders the edit venue form" do
    render
    
    response.should have_tag("form[action=#{venue_path(@venue)}][method=post]") do
    end
  end
end


