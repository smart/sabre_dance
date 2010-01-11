require 'spec_helper'

describe PhotoAlbumsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/photo_albums" }.should route_to(:controller => "photo_albums", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/photo_albums/new" }.should route_to(:controller => "photo_albums", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/photo_albums/1" }.should route_to(:controller => "photo_albums", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/photo_albums/1/edit" }.should route_to(:controller => "photo_albums", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/photo_albums" }.should route_to(:controller => "photo_albums", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/photo_albums/1" }.should route_to(:controller => "photo_albums", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/photo_albums/1" }.should route_to(:controller => "photo_albums", :action => "destroy", :id => "1") 
    end
  end
end
