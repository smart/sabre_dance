require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowsController do

  def mock_show(stubs={})
    @mock_show ||= mock_model(Show, stubs)
  end
  
  describe "GET index" do
    it "assigns all shows as @shows" do
      Show.stub!(:find).with(:all).and_return([mock_show])
      get :index
      assigns[:shows].should == [mock_show]
    end
  end

  describe "GET show" do
    it "assigns the requested show as @show" do
      Show.stub!(:find).with("37").and_return(mock_show)
      get :show, :id => "37"
      assigns[:show].should equal(mock_show)
    end
  end

  describe "GET new" do
    it "assigns a new show as @show" do
      Show.stub!(:new).and_return(mock_show)
      get :new
      assigns[:show].should equal(mock_show)
    end
  end

  describe "GET edit" do
    it "assigns the requested show as @show" do
      Show.stub!(:find).with("37").and_return(mock_show)
      get :edit, :id => "37"
      assigns[:show].should equal(mock_show)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created show as @show" do
        Show.stub!(:new).with({'these' => 'params'}).and_return(mock_show(:save => true))
        post :create, :show => {:these => 'params'}
        assigns[:show].should equal(mock_show)
      end

      it "redirects to the created show" do
        Show.stub!(:new).and_return(mock_show(:save => true))
        post :create, :show => {}
        response.should redirect_to(show_url(mock_show))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved show as @show" do
        Show.stub!(:new).with({'these' => 'params'}).and_return(mock_show(:save => false))
        post :create, :show => {:these => 'params'}
        assigns[:show].should equal(mock_show)
      end

      it "re-renders the 'new' template" do
        Show.stub!(:new).and_return(mock_show(:save => false))
        post :create, :show => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested show" do
        Show.should_receive(:find).with("37").and_return(mock_show)
        mock_show.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show => {:these => 'params'}
      end

      it "assigns the requested show as @show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => true))
        put :update, :id => "1"
        assigns[:show].should equal(mock_show)
      end

      it "redirects to the show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(show_url(mock_show))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested show" do
        Show.should_receive(:find).with("37").and_return(mock_show)
        mock_show.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show => {:these => 'params'}
      end

      it "assigns the show as @show" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => false))
        put :update, :id => "1"
        assigns[:show].should equal(mock_show)
      end

      it "re-renders the 'edit' template" do
        Show.stub!(:find).and_return(mock_show(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested show" do
      Show.should_receive(:find).with("37").and_return(mock_show)
      mock_show.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the shows list" do
      Show.stub!(:find).and_return(mock_show(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(shows_url)
    end
  end

end
