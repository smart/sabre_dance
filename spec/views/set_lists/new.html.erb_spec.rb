require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/set_lists/new.html.erb" do
  include SetListsHelper
  
  before(:each) do
    assigns[:set_list] = stub_model(SetList,
      :new_record? => true
    )
  end

  it "renders new set_list form" do
    render
    
    response.should have_tag("form[action=?][method=post]", set_lists_path) do
    end
  end
end


