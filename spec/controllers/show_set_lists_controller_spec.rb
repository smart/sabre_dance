require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShowSetListsController do

  def mock_show_set_list(stubs={})
    @mock_show_set_list ||= mock_model(ShowSetList, stubs)
  end
  
  describe "GET index" do
    it "assigns all show_set_lists as @show_set_lists" do
      ShowSetList.stub!(:find).with(:all).and_return([mock_show_set_list])
      get :index
      assigns[:show_set_lists].should == [mock_show_set_list]
    end
  end

  describe "GET show" do
    it "assigns the requested show_set_list as @show_set_list" do
      ShowSetList.stub!(:find).with("37").and_return(mock_show_set_list)
      get :show, :id => "37"
      assigns[:show_set_list].should equal(mock_show_set_list)
    end
  end

  describe "GET new" do
    it "assigns a new show_set_list as @show_set_list" do
      ShowSetList.stub!(:new).and_return(mock_show_set_list)
      get :new
      assigns[:show_set_list].should equal(mock_show_set_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested show_set_list as @show_set_list" do
      ShowSetList.stub!(:find).with("37").and_return(mock_show_set_list)
      get :edit, :id => "37"
      assigns[:show_set_list].should equal(mock_show_set_list)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created show_set_list as @show_set_list" do
        ShowSetList.stub!(:new).with({'these' => 'params'}).and_return(mock_show_set_list(:save => true))
        post :create, :show_set_list => {:these => 'params'}
        assigns[:show_set_list].should equal(mock_show_set_list)
      end

      it "redirects to the created show_set_list" do
        ShowSetList.stub!(:new).and_return(mock_show_set_list(:save => true))
        post :create, :show_set_list => {}
        response.should redirect_to(show_set_list_url(mock_show_set_list))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved show_set_list as @show_set_list" do
        ShowSetList.stub!(:new).with({'these' => 'params'}).and_return(mock_show_set_list(:save => false))
        post :create, :show_set_list => {:these => 'params'}
        assigns[:show_set_list].should equal(mock_show_set_list)
      end

      it "re-renders the 'new' template" do
        ShowSetList.stub!(:new).and_return(mock_show_set_list(:save => false))
        post :create, :show_set_list => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested show_set_list" do
        ShowSetList.should_receive(:find).with("37").and_return(mock_show_set_list)
        mock_show_set_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show_set_list => {:these => 'params'}
      end

      it "assigns the requested show_set_list as @show_set_list" do
        ShowSetList.stub!(:find).and_return(mock_show_set_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:show_set_list].should equal(mock_show_set_list)
      end

      it "redirects to the show_set_list" do
        ShowSetList.stub!(:find).and_return(mock_show_set_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(show_set_list_url(mock_show_set_list))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested show_set_list" do
        ShowSetList.should_receive(:find).with("37").and_return(mock_show_set_list)
        mock_show_set_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :show_set_list => {:these => 'params'}
      end

      it "assigns the show_set_list as @show_set_list" do
        ShowSetList.stub!(:find).and_return(mock_show_set_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:show_set_list].should equal(mock_show_set_list)
      end

      it "re-renders the 'edit' template" do
        ShowSetList.stub!(:find).and_return(mock_show_set_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested show_set_list" do
      ShowSetList.should_receive(:find).with("37").and_return(mock_show_set_list)
      mock_show_set_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the show_set_lists list" do
      ShowSetList.stub!(:find).and_return(mock_show_set_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(show_set_lists_url)
    end
  end

end
