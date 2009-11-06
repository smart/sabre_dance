require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/new.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:show] = stub_model(Show,
      :new_record? => true
    )
  end

  it "renders new show form" do
    render
    
    response.should have_tag("form[action=?][method=post]", shows_path) do
    end
  end
end


