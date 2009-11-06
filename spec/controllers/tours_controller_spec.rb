require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ToursController do

  def mock_tour(stubs={})
    @mock_tour ||= mock_model(Tour, stubs)
  end
  
  describe "GET index" do
    it "assigns all tours as @tours" do
      Tour.stub!(:find).with(:all).and_return([mock_tour])
      get :index
      assigns[:tours].should == [mock_tour]
    end
  end

  describe "GET show" do
    it "assigns the requested tour as @tour" do
      Tour.stub!(:find).with("37").and_return(mock_tour)
      get :show, :id => "37"
      assigns[:tour].should equal(mock_tour)
    end
  end

  describe "GET new" do
    it "assigns a new tour as @tour" do
      Tour.stub!(:new).and_return(mock_tour)
      get :new
      assigns[:tour].should equal(mock_tour)
    end
  end

  describe "GET edit" do
    it "assigns the requested tour as @tour" do
      Tour.stub!(:find).with("37").and_return(mock_tour)
      get :edit, :id => "37"
      assigns[:tour].should equal(mock_tour)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created tour as @tour" do
        Tour.stub!(:new).with({'these' => 'params'}).and_return(mock_tour(:save => true))
        post :create, :tour => {:these => 'params'}
        assigns[:tour].should equal(mock_tour)
      end

      it "redirects to the created tour" do
        Tour.stub!(:new).and_return(mock_tour(:save => true))
        post :create, :tour => {}
        response.should redirect_to(tour_url(mock_tour))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved tour as @tour" do
        Tour.stub!(:new).with({'these' => 'params'}).and_return(mock_tour(:save => false))
        post :create, :tour => {:these => 'params'}
        assigns[:tour].should equal(mock_tour)
      end

      it "re-renders the 'new' template" do
        Tour.stub!(:new).and_return(mock_tour(:save => false))
        post :create, :tour => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested tour" do
        Tour.should_receive(:find).with("37").and_return(mock_tour)
        mock_tour.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tour => {:these => 'params'}
      end

      it "assigns the requested tour as @tour" do
        Tour.stub!(:find).and_return(mock_tour(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tour].should equal(mock_tour)
      end

      it "redirects to the tour" do
        Tour.stub!(:find).and_return(mock_tour(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tour_url(mock_tour))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested tour" do
        Tour.should_receive(:find).with("37").and_return(mock_tour)
        mock_tour.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tour => {:these => 'params'}
      end

      it "assigns the tour as @tour" do
        Tour.stub!(:find).and_return(mock_tour(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tour].should equal(mock_tour)
      end

      it "re-renders the 'edit' template" do
        Tour.stub!(:find).and_return(mock_tour(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested tour" do
      Tour.should_receive(:find).with("37").and_return(mock_tour)
      mock_tour.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the tours list" do
      Tour.stub!(:find).and_return(mock_tour(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tours_url)
    end
  end

end
