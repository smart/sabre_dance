require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/new.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venue] = stub_model(Venue,
      :new_record? => true
    )
  end

  it "renders new venue form" do
    render
    
    response.should have_tag("form[action=?][method=post]", venues_path) do
    end
  end
end


