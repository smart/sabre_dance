require 'spec_helper'

describe SequencesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/sequences" }.should route_to(:controller => "sequences", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sequences/new" }.should route_to(:controller => "sequences", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sequences/1" }.should route_to(:controller => "sequences", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sequences/1/edit" }.should route_to(:controller => "sequences", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sequences" }.should route_to(:controller => "sequences", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/sequences/1" }.should route_to(:controller => "sequences", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sequences/1" }.should route_to(:controller => "sequences", :action => "destroy", :id => "1") 
    end
  end
end
