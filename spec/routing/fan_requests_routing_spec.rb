require 'spec_helper'

describe FanRequestsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/fan_requests" }.should route_to(:controller => "fan_requests", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fan_requests/new" }.should route_to(:controller => "fan_requests", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fan_requests/1" }.should route_to(:controller => "fan_requests", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fan_requests/1/edit" }.should route_to(:controller => "fan_requests", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fan_requests" }.should route_to(:controller => "fan_requests", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/fan_requests/1" }.should route_to(:controller => "fan_requests", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fan_requests/1" }.should route_to(:controller => "fan_requests", :action => "destroy", :id => "1") 
    end
  end
end
