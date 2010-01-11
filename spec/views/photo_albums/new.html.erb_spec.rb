require 'spec_helper'

describe "/photo_albums/new.html.erb" do
  include PhotoAlbumsHelper

  before(:each) do
    assigns[:photo_album] = stub_model(PhotoAlbum,
      :new_record? => true
    )
  end

  it "renders new photo_album form" do
    render

    response.should have_tag("form[action=?][method=post]", photo_albums_path) do
    end
  end
end
