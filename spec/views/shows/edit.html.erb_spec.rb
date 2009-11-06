require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/edit.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:show] = @show = stub_model(Show,
      :new_record? => false
    )
  end

  it "renders the edit show form" do
    render
    
    response.should have_tag("form[action=#{show_path(@show)}][method=post]") do
    end
  end
end


