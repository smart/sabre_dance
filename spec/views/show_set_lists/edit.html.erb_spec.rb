require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/show_set_lists/edit.html.erb" do
  include ShowSetListsHelper
  
  before(:each) do
    assigns[:show_set_list] = @show_set_list = stub_model(ShowSetList,
      :new_record? => false
    )
  end

  it "renders the edit show_set_list form" do
    render
    
    response.should have_tag("form[action=#{show_set_list_path(@show_set_list)}][method=post]") do
    end
  end
end


