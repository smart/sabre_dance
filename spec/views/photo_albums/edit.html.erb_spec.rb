require 'spec_helper'

describe "/photo_albums/edit.html.erb" do
  include PhotoAlbumsHelper

  before(:each) do
    assigns[:photo_album] = @photo_album = stub_model(PhotoAlbum,
      :new_record? => false
    )
  end

  it "renders the edit photo_album form" do
    render

    response.should have_tag("form[action=#{photo_album_path(@photo_album)}][method=post]") do
    end
  end
end
