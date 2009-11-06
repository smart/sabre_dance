require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/set_lists/show.html.erb" do
  include SetListsHelper
  before(:each) do
    assigns[:set_list] = @set_list = stub_model(SetList)
  end

  it "renders attributes in <p>" do
    render
  end
end

