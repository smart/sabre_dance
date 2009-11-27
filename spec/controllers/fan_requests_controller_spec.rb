require 'spec_helper'

describe FanRequestsController do

  def mock_fan_request(stubs={})
    @mock_fan_request ||= mock_model(FanRequest, stubs)
  end

  describe "GET index" do
    it "assigns all fan_requests as @fan_requests" do
      FanRequest.stub!(:find).with(:all).and_return([mock_fan_request])
      get :index
      assigns[:fan_requests].should == [mock_fan_request]
    end
  end

  describe "GET show" do
    it "assigns the requested fan_request as @fan_request" do
      FanRequest.stub!(:find).with("37").and_return(mock_fan_request)
      get :show, :id => "37"
      assigns[:fan_request].should equal(mock_fan_request)
    end
  end

  describe "GET new" do
    it "assigns a new fan_request as @fan_request" do
      FanRequest.stub!(:new).and_return(mock_fan_request)
      get :new
      assigns[:fan_request].should equal(mock_fan_request)
    end
  end

  describe "GET edit" do
    it "assigns the requested fan_request as @fan_request" do
      FanRequest.stub!(:find).with("37").and_return(mock_fan_request)
      get :edit, :id => "37"
      assigns[:fan_request].should equal(mock_fan_request)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fan_request as @fan_request" do
        FanRequest.stub!(:new).with({'these' => 'params'}).and_return(mock_fan_request(:save => true))
        post :create, :fan_request => {:these => 'params'}
        assigns[:fan_request].should equal(mock_fan_request)
      end

      it "redirects to the created fan_request" do
        FanRequest.stub!(:new).and_return(mock_fan_request(:save => true))
        post :create, :fan_request => {}
        response.should redirect_to(fan_request_url(mock_fan_request))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fan_request as @fan_request" do
        FanRequest.stub!(:new).with({'these' => 'params'}).and_return(mock_fan_request(:save => false))
        post :create, :fan_request => {:these => 'params'}
        assigns[:fan_request].should equal(mock_fan_request)
      end

      it "re-renders the 'new' template" do
        FanRequest.stub!(:new).and_return(mock_fan_request(:save => false))
        post :create, :fan_request => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fan_request" do
        FanRequest.should_receive(:find).with("37").and_return(mock_fan_request)
        mock_fan_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fan_request => {:these => 'params'}
      end

      it "assigns the requested fan_request as @fan_request" do
        FanRequest.stub!(:find).and_return(mock_fan_request(:update_attributes => true))
        put :update, :id => "1"
        assigns[:fan_request].should equal(mock_fan_request)
      end

      it "redirects to the fan_request" do
        FanRequest.stub!(:find).and_return(mock_fan_request(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(fan_request_url(mock_fan_request))
      end
    end

    describe "with invalid params" do
      it "updates the requested fan_request" do
        FanRequest.should_receive(:find).with("37").and_return(mock_fan_request)
        mock_fan_request.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fan_request => {:these => 'params'}
      end

      it "assigns the fan_request as @fan_request" do
        FanRequest.stub!(:find).and_return(mock_fan_request(:update_attributes => false))
        put :update, :id => "1"
        assigns[:fan_request].should equal(mock_fan_request)
      end

      it "re-renders the 'edit' template" do
        FanRequest.stub!(:find).and_return(mock_fan_request(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fan_request" do
      FanRequest.should_receive(:find).with("37").and_return(mock_fan_request)
      mock_fan_request.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fan_requests list" do
      FanRequest.stub!(:find).and_return(mock_fan_request(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(fan_requests_url)
    end
  end

end
