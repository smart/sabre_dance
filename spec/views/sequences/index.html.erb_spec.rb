require 'spec_helper'

describe "/sequences/index.html.erb" do
  include SequencesHelper

  before(:each) do
    assigns[:sequences] = [
      stub_model(Sequence),
      stub_model(Sequence)
    ]
  end

  it "renders a list of sequences" do
    render
  end
end
