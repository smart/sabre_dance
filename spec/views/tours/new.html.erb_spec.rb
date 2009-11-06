require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tours/new.html.erb" do
  include ToursHelper
  
  before(:each) do
    assigns[:tour] = stub_model(Tour,
      :new_record? => true
    )
  end

  it "renders new tour form" do
    render
    
    response.should have_tag("form[action=?][method=post]", tours_path) do
    end
  end
end


