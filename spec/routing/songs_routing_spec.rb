require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "songs", :action => "index").should == "/songs"
    end
  
    it "maps #new" do
      route_for(:controller => "songs", :action => "new").should == "/songs/new"
    end
  
    it "maps #show" do
      route_for(:controller => "songs", :action => "show", :id => "1").should == "/songs/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "songs", :action => "edit", :id => "1").should == "/songs/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "songs", :action => "create").should == {:path => "/songs", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "songs", :action => "update", :id => "1").should == {:path =>"/songs/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "songs", :action => "destroy", :id => "1").should == {:path =>"/songs/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/songs").should == {:controller => "songs", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/songs/new").should == {:controller => "songs", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/songs").should == {:controller => "songs", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/songs/1").should == {:controller => "songs", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/songs/1/edit").should == {:controller => "songs", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/songs/1").should == {:controller => "songs", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/songs/1").should == {:controller => "songs", :action => "destroy", :id => "1"}
    end
  end
end
