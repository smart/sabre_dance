require 'spec_helper'

describe "/sequences/new.html.erb" do
  include SequencesHelper

  before(:each) do
    assigns[:sequence] = stub_model(Sequence,
      :new_record? => true
    )
  end

  it "renders new sequence form" do
    render

    response.should have_tag("form[action=?][method=post]", sequences_path) do
    end
  end
end
