require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/show_set_lists/show.html.erb" do
  include ShowSetListsHelper
  before(:each) do
    assigns[:show_set_list] = @show_set_list = stub_model(ShowSetList)
  end

  it "renders attributes in <p>" do
    render
  end
end

