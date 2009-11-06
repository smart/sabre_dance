require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tours/edit.html.erb" do
  include ToursHelper
  
  before(:each) do
    assigns[:tour] = @tour = stub_model(Tour,
      :new_record? => false
    )
  end

  it "renders the edit tour form" do
    render
    
    response.should have_tag("form[action=#{tour_path(@tour)}][method=post]") do
    end
  end
end


