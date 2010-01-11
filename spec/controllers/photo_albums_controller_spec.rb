require 'spec_helper'

describe PhotoAlbumsController do

  def mock_photo_album(stubs={})
    @mock_photo_album ||= mock_model(PhotoAlbum, stubs)
  end

  describe "GET index" do
    it "assigns all photo_albums as @photo_albums" do
      PhotoAlbum.stub!(:find).with(:all).and_return([mock_photo_album])
      get :index
      assigns[:photo_albums].should == [mock_photo_album]
    end
  end

  describe "GET show" do
    it "assigns the requested photo_album as @photo_album" do
      PhotoAlbum.stub!(:find).with("37").and_return(mock_photo_album)
      get :show, :id => "37"
      assigns[:photo_album].should equal(mock_photo_album)
    end
  end

  describe "GET new" do
    it "assigns a new photo_album as @photo_album" do
      PhotoAlbum.stub!(:new).and_return(mock_photo_album)
      get :new
      assigns[:photo_album].should equal(mock_photo_album)
    end
  end

  describe "GET edit" do
    it "assigns the requested photo_album as @photo_album" do
      PhotoAlbum.stub!(:find).with("37").and_return(mock_photo_album)
      get :edit, :id => "37"
      assigns[:photo_album].should equal(mock_photo_album)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created photo_album as @photo_album" do
        PhotoAlbum.stub!(:new).with({'these' => 'params'}).and_return(mock_photo_album(:save => true))
        post :create, :photo_album => {:these => 'params'}
        assigns[:photo_album].should equal(mock_photo_album)
      end

      it "redirects to the created photo_album" do
        PhotoAlbum.stub!(:new).and_return(mock_photo_album(:save => true))
        post :create, :photo_album => {}
        response.should redirect_to(photo_album_url(mock_photo_album))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved photo_album as @photo_album" do
        PhotoAlbum.stub!(:new).with({'these' => 'params'}).and_return(mock_photo_album(:save => false))
        post :create, :photo_album => {:these => 'params'}
        assigns[:photo_album].should equal(mock_photo_album)
      end

      it "re-renders the 'new' template" do
        PhotoAlbum.stub!(:new).and_return(mock_photo_album(:save => false))
        post :create, :photo_album => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested photo_album" do
        PhotoAlbum.should_receive(:find).with("37").and_return(mock_photo_album)
        mock_photo_album.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_album => {:these => 'params'}
      end

      it "assigns the requested photo_album as @photo_album" do
        PhotoAlbum.stub!(:find).and_return(mock_photo_album(:update_attributes => true))
        put :update, :id => "1"
        assigns[:photo_album].should equal(mock_photo_album)
      end

      it "redirects to the photo_album" do
        PhotoAlbum.stub!(:find).and_return(mock_photo_album(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(photo_album_url(mock_photo_album))
      end
    end

    describe "with invalid params" do
      it "updates the requested photo_album" do
        PhotoAlbum.should_receive(:find).with("37").and_return(mock_photo_album)
        mock_photo_album.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :photo_album => {:these => 'params'}
      end

      it "assigns the photo_album as @photo_album" do
        PhotoAlbum.stub!(:find).and_return(mock_photo_album(:update_attributes => false))
        put :update, :id => "1"
        assigns[:photo_album].should equal(mock_photo_album)
      end

      it "re-renders the 'edit' template" do
        PhotoAlbum.stub!(:find).and_return(mock_photo_album(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested photo_album" do
      PhotoAlbum.should_receive(:find).with("37").and_return(mock_photo_album)
      mock_photo_album.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the photo_albums list" do
      PhotoAlbum.stub!(:find).and_return(mock_photo_album(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(photo_albums_url)
    end
  end

end
