require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/set_lists/index.html.erb" do
  include SetListsHelper
  
  before(:each) do
    assigns[:set_lists] = [
      stub_model(SetList),
      stub_model(SetList)
    ]
  end

  it "renders a list of set_lists" do
    render
  end
end

