require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/show_set_lists/index.html.erb" do
  include ShowSetListsHelper
  
  before(:each) do
    assigns[:show_set_lists] = [
      stub_model(ShowSetList),
      stub_model(ShowSetList)
    ]
  end

  it "renders a list of show_set_lists" do
    render
  end
end

