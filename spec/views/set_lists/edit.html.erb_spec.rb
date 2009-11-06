require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/set_lists/edit.html.erb" do
  include SetListsHelper
  
  before(:each) do
    assigns[:set_list] = @set_list = stub_model(SetList,
      :new_record? => false
    )
  end

  it "renders the edit set_list form" do
    render
    
    response.should have_tag("form[action=#{set_list_path(@set_list)}][method=post]") do
    end
  end
end


