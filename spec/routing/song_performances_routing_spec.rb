require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongPerformancesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "song_performances", :action => "index").should == "/song_performances"
    end
  
    it "maps #new" do
      route_for(:controller => "song_performances", :action => "new").should == "/song_performances/new"
    end
  
    it "maps #show" do
      route_for(:controller => "song_performances", :action => "show", :id => "1").should == "/song_performances/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "song_performances", :action => "edit", :id => "1").should == "/song_performances/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "song_performances", :action => "create").should == {:path => "/song_performances", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "song_performances", :action => "update", :id => "1").should == {:path =>"/song_performances/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "song_performances", :action => "destroy", :id => "1").should == {:path =>"/song_performances/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/song_performances").should == {:controller => "song_performances", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/song_performances/new").should == {:controller => "song_performances", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/song_performances").should == {:controller => "song_performances", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/song_performances/1").should == {:controller => "song_performances", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/song_performances/1/edit").should == {:controller => "song_performances", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/song_performances/1").should == {:controller => "song_performances", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/song_performances/1").should == {:controller => "song_performances", :action => "destroy", :id => "1"}
    end
  end
end
