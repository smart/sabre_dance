require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/show_set_lists/new.html.erb" do
  include ShowSetListsHelper
  
  before(:each) do
    assigns[:show_set_list] = stub_model(ShowSetList,
      :new_record? => true
    )
  end

  it "renders new show_set_list form" do
    render
    
    response.should have_tag("form[action=?][method=post]", show_set_lists_path) do
    end
  end
end


