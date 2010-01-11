require 'spec_helper'

describe "/photo_albums/show.html.erb" do
  include PhotoAlbumsHelper
  before(:each) do
    assigns[:photo_album] = @photo_album = stub_model(PhotoAlbum)
  end

  it "renders attributes in <p>" do
    render
  end
end
