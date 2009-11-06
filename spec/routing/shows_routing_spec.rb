require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "shows", :action => "index").should == "/shows"
    end
  
    it "maps #new" do
      route_for(:controller => "shows", :action => "new").should == "/shows/new"
    end
  
    it "maps #show" do
      route_for(:controller => "shows", :action => "show", :id => "1").should == "/shows/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "shows", :action => "edit", :id => "1").should == "/shows/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "shows", :action => "create").should == {:path => "/shows", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "shows", :action => "update", :id => "1").should == {:path =>"/shows/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "shows", :action => "destroy", :id => "1").should == {:path =>"/shows/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/shows").should == {:controller => "shows", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/shows/new").should == {:controller => "shows", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/shows").should == {:controller => "shows", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/shows/1").should == {:controller => "shows", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/shows/1/edit").should == {:controller => "shows", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/shows/1").should == {:controller => "shows", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/shows/1").should == {:controller => "shows", :action => "destroy", :id => "1"}
    end
  end
end
