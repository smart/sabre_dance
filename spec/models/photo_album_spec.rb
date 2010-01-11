require 'spec_helper'



describe PhotoAlbum do

  it "should create a new instance given valid attributes" do
    PhotoAlbum.create!(@valid_attributes)
  end

  it "should find all of the biscuits albums" do
    albums = Picasa.albums(:google_user => PICASA_USER)
    albums.size.should == 5
  end

  it "should insert all albums as photo albums" do
    PhotoAlbum.sync_from_picasa
    PhotoAlbum.count.should == 5
  end

  it "should not sync the same album more than once" do
    PhotoAlbum.sync_from_picasa
    PhotoAlbum.count.should == 5
    PhotoAlbum.sync_from_picasa
    PhotoAlbum.count.should == 5
  end

  it "should parse a picasa title into date, author, title" do
    PhotoAlbum.parse_picasa_title("2009-02-14 - Ogden Theater, Denver, CO (Britt Nemeth)").should == {:date => Date.parse("2009-02-14"), :credit => "Britt Nemeth", :title => "Ogden Theater, Denver, CO"}
  end


  it "should find photos from picasa" do
    photos = Picasa.photos(:google_user => PICASA_USER, :album_id => 5421481282645844849)
    photos[:photos].size.should == 4
  end

  it "should sync photos from picasa" do
    photo_album = Factory(:photo_album, :picasa_id => 5421481282645844849)
    photos = photo_album.photos_from_picasa
    photos.size.should == 4
  end

  it "process photos should set photos as association from picasa" do
    photo_album = Factory(:photo_album, :picasa_id => 5421481282645844849)
    photo_album.photos.size.should == 4
  end


end
