require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ToursController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "tours", :action => "index").should == "/tours"
    end
  
    it "maps #new" do
      route_for(:controller => "tours", :action => "new").should == "/tours/new"
    end
  
    it "maps #show" do
      route_for(:controller => "tours", :action => "show", :id => "1").should == "/tours/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "tours", :action => "edit", :id => "1").should == "/tours/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "tours", :action => "create").should == {:path => "/tours", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "tours", :action => "update", :id => "1").should == {:path =>"/tours/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "tours", :action => "destroy", :id => "1").should == {:path =>"/tours/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/tours").should == {:controller => "tours", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/tours/new").should == {:controller => "tours", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/tours").should == {:controller => "tours", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/tours/1").should == {:controller => "tours", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/tours/1/edit").should == {:controller => "tours", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/tours/1").should == {:controller => "tours", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/tours/1").should == {:controller => "tours", :action => "destroy", :id => "1"}
    end
  end
end
