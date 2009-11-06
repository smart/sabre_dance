require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowSetListsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "show_set_lists", :action => "index").should == "/show_set_lists"
    end
  
    it "maps #new" do
      route_for(:controller => "show_set_lists", :action => "new").should == "/show_set_lists/new"
    end
  
    it "maps #show" do
      route_for(:controller => "show_set_lists", :action => "show", :id => "1").should == "/show_set_lists/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "show_set_lists", :action => "edit", :id => "1").should == "/show_set_lists/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "show_set_lists", :action => "create").should == {:path => "/show_set_lists", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "show_set_lists", :action => "update", :id => "1").should == {:path =>"/show_set_lists/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "show_set_lists", :action => "destroy", :id => "1").should == {:path =>"/show_set_lists/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/show_set_lists").should == {:controller => "show_set_lists", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/show_set_lists/new").should == {:controller => "show_set_lists", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/show_set_lists").should == {:controller => "show_set_lists", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/show_set_lists/1").should == {:controller => "show_set_lists", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/show_set_lists/1/edit").should == {:controller => "show_set_lists", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/show_set_lists/1").should == {:controller => "show_set_lists", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/show_set_lists/1").should == {:controller => "show_set_lists", :action => "destroy", :id => "1"}
    end
  end
end
