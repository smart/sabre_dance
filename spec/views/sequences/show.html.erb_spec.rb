require 'spec_helper'

describe "/sequences/show.html.erb" do
  include SequencesHelper
  before(:each) do
    assigns[:sequence] = @sequence = stub_model(Sequence)
  end

  it "renders attributes in <p>" do
    render
  end
end
