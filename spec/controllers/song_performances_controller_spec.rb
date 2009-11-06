require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongPerformancesController do

  def mock_song_performance(stubs={})
    @mock_song_performance ||= mock_model(SongPerformance, stubs)
  end
  
  describe "GET index" do
    it "assigns all song_performances as @song_performances" do
      SongPerformance.stub!(:find).with(:all).and_return([mock_song_performance])
      get :index
      assigns[:song_performances].should == [mock_song_performance]
    end
  end

  describe "GET show" do
    it "assigns the requested song_performance as @song_performance" do
      SongPerformance.stub!(:find).with("37").and_return(mock_song_performance)
      get :show, :id => "37"
      assigns[:song_performance].should equal(mock_song_performance)
    end
  end

  describe "GET new" do
    it "assigns a new song_performance as @song_performance" do
      SongPerformance.stub!(:new).and_return(mock_song_performance)
      get :new
      assigns[:song_performance].should equal(mock_song_performance)
    end
  end

  describe "GET edit" do
    it "assigns the requested song_performance as @song_performance" do
      SongPerformance.stub!(:find).with("37").and_return(mock_song_performance)
      get :edit, :id => "37"
      assigns[:song_performance].should equal(mock_song_performance)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created song_performance as @song_performance" do
        SongPerformance.stub!(:new).with({'these' => 'params'}).and_return(mock_song_performance(:save => true))
        post :create, :song_performance => {:these => 'params'}
        assigns[:song_performance].should equal(mock_song_performance)
      end

      it "redirects to the created song_performance" do
        SongPerformance.stub!(:new).and_return(mock_song_performance(:save => true))
        post :create, :song_performance => {}
        response.should redirect_to(song_performance_url(mock_song_performance))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved song_performance as @song_performance" do
        SongPerformance.stub!(:new).with({'these' => 'params'}).and_return(mock_song_performance(:save => false))
        post :create, :song_performance => {:these => 'params'}
        assigns[:song_performance].should equal(mock_song_performance)
      end

      it "re-renders the 'new' template" do
        SongPerformance.stub!(:new).and_return(mock_song_performance(:save => false))
        post :create, :song_performance => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested song_performance" do
        SongPerformance.should_receive(:find).with("37").and_return(mock_song_performance)
        mock_song_performance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :song_performance => {:these => 'params'}
      end

      it "assigns the requested song_performance as @song_performance" do
        SongPerformance.stub!(:find).and_return(mock_song_performance(:update_attributes => true))
        put :update, :id => "1"
        assigns[:song_performance].should equal(mock_song_performance)
      end

      it "redirects to the song_performance" do
        SongPerformance.stub!(:find).and_return(mock_song_performance(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(song_performance_url(mock_song_performance))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested song_performance" do
        SongPerformance.should_receive(:find).with("37").and_return(mock_song_performance)
        mock_song_performance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :song_performance => {:these => 'params'}
      end

      it "assigns the song_performance as @song_performance" do
        SongPerformance.stub!(:find).and_return(mock_song_performance(:update_attributes => false))
        put :update, :id => "1"
        assigns[:song_performance].should equal(mock_song_performance)
      end

      it "re-renders the 'edit' template" do
        SongPerformance.stub!(:find).and_return(mock_song_performance(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested song_performance" do
      SongPerformance.should_receive(:find).with("37").and_return(mock_song_performance)
      mock_song_performance.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the song_performances list" do
      SongPerformance.stub!(:find).and_return(mock_song_performance(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(song_performances_url)
    end
  end

end
