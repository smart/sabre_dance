require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SetListsController do

  def mock_set_list(stubs={})
    @mock_set_list ||= mock_model(SetList, stubs)
  end
  
  describe "GET index" do
    it "assigns all set_lists as @set_lists" do
      SetList.stub!(:find).with(:all).and_return([mock_set_list])
      get :index
      assigns[:set_lists].should == [mock_set_list]
    end
  end

  describe "GET show" do
    it "assigns the requested set_list as @set_list" do
      SetList.stub!(:find).with("37").and_return(mock_set_list)
      get :show, :id => "37"
      assigns[:set_list].should equal(mock_set_list)
    end
  end

  describe "GET new" do
    it "assigns a new set_list as @set_list" do
      SetList.stub!(:new).and_return(mock_set_list)
      get :new
      assigns[:set_list].should equal(mock_set_list)
    end
  end

  describe "GET edit" do
    it "assigns the requested set_list as @set_list" do
      SetList.stub!(:find).with("37").and_return(mock_set_list)
      get :edit, :id => "37"
      assigns[:set_list].should equal(mock_set_list)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created set_list as @set_list" do
        SetList.stub!(:new).with({'these' => 'params'}).and_return(mock_set_list(:save => true))
        post :create, :set_list => {:these => 'params'}
        assigns[:set_list].should equal(mock_set_list)
      end

      it "redirects to the created set_list" do
        SetList.stub!(:new).and_return(mock_set_list(:save => true))
        post :create, :set_list => {}
        response.should redirect_to(set_list_url(mock_set_list))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved set_list as @set_list" do
        SetList.stub!(:new).with({'these' => 'params'}).and_return(mock_set_list(:save => false))
        post :create, :set_list => {:these => 'params'}
        assigns[:set_list].should equal(mock_set_list)
      end

      it "re-renders the 'new' template" do
        SetList.stub!(:new).and_return(mock_set_list(:save => false))
        post :create, :set_list => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested set_list" do
        SetList.should_receive(:find).with("37").and_return(mock_set_list)
        mock_set_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :set_list => {:these => 'params'}
      end

      it "assigns the requested set_list as @set_list" do
        SetList.stub!(:find).and_return(mock_set_list(:update_attributes => true))
        put :update, :id => "1"
        assigns[:set_list].should equal(mock_set_list)
      end

      it "redirects to the set_list" do
        SetList.stub!(:find).and_return(mock_set_list(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(set_list_url(mock_set_list))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested set_list" do
        SetList.should_receive(:find).with("37").and_return(mock_set_list)
        mock_set_list.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :set_list => {:these => 'params'}
      end

      it "assigns the set_list as @set_list" do
        SetList.stub!(:find).and_return(mock_set_list(:update_attributes => false))
        put :update, :id => "1"
        assigns[:set_list].should equal(mock_set_list)
      end

      it "re-renders the 'edit' template" do
        SetList.stub!(:find).and_return(mock_set_list(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested set_list" do
      SetList.should_receive(:find).with("37").and_return(mock_set_list)
      mock_set_list.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the set_lists list" do
      SetList.stub!(:find).and_return(mock_set_list(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(set_lists_url)
    end
  end

end
