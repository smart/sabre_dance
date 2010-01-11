require 'spec_helper'

describe "/photo_albums/index.html.erb" do
  include PhotoAlbumsHelper

  before(:each) do
    assigns[:photo_albums] = [
      stub_model(PhotoAlbum),
      stub_model(PhotoAlbum)
    ]
  end

  it "renders a list of photo_albums" do
    render
  end
end
