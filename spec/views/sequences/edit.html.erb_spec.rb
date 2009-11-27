require 'spec_helper'

describe "/sequences/edit.html.erb" do
  include SequencesHelper

  before(:each) do
    assigns[:sequence] = @sequence = stub_model(Sequence,
      :new_record? => false
    )
  end

  it "renders the edit sequence form" do
    render

    response.should have_tag("form[action=#{sequence_path(@sequence)}][method=post]") do
    end
  end
end
