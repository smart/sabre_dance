require 'spec_helper'

describe SequencesController do

  def mock_sequence(stubs={})
    @mock_sequence ||= mock_model(Sequence, stubs)
  end

  describe "GET index" do
    it "assigns all sequences as @sequences" do
      Sequence.stub!(:find).with(:all).and_return([mock_sequence])
      get :index
      assigns[:sequences].should == [mock_sequence]
    end
  end

  describe "GET show" do
    it "assigns the requested sequence as @sequence" do
      Sequence.stub!(:find).with("37").and_return(mock_sequence)
      get :show, :id => "37"
      assigns[:sequence].should equal(mock_sequence)
    end
  end

  describe "GET new" do
    it "assigns a new sequence as @sequence" do
      Sequence.stub!(:new).and_return(mock_sequence)
      get :new
      assigns[:sequence].should equal(mock_sequence)
    end
  end

  describe "GET edit" do
    it "assigns the requested sequence as @sequence" do
      Sequence.stub!(:find).with("37").and_return(mock_sequence)
      get :edit, :id => "37"
      assigns[:sequence].should equal(mock_sequence)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sequence as @sequence" do
        Sequence.stub!(:new).with({'these' => 'params'}).and_return(mock_sequence(:save => true))
        post :create, :sequence => {:these => 'params'}
        assigns[:sequence].should equal(mock_sequence)
      end

      it "redirects to the created sequence" do
        Sequence.stub!(:new).and_return(mock_sequence(:save => true))
        post :create, :sequence => {}
        response.should redirect_to(sequence_url(mock_sequence))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sequence as @sequence" do
        Sequence.stub!(:new).with({'these' => 'params'}).and_return(mock_sequence(:save => false))
        post :create, :sequence => {:these => 'params'}
        assigns[:sequence].should equal(mock_sequence)
      end

      it "re-renders the 'new' template" do
        Sequence.stub!(:new).and_return(mock_sequence(:save => false))
        post :create, :sequence => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sequence" do
        Sequence.should_receive(:find).with("37").and_return(mock_sequence)
        mock_sequence.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sequence => {:these => 'params'}
      end

      it "assigns the requested sequence as @sequence" do
        Sequence.stub!(:find).and_return(mock_sequence(:update_attributes => true))
        put :update, :id => "1"
        assigns[:sequence].should equal(mock_sequence)
      end

      it "redirects to the sequence" do
        Sequence.stub!(:find).and_return(mock_sequence(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sequence_url(mock_sequence))
      end
    end

    describe "with invalid params" do
      it "updates the requested sequence" do
        Sequence.should_receive(:find).with("37").and_return(mock_sequence)
        mock_sequence.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sequence => {:these => 'params'}
      end

      it "assigns the sequence as @sequence" do
        Sequence.stub!(:find).and_return(mock_sequence(:update_attributes => false))
        put :update, :id => "1"
        assigns[:sequence].should equal(mock_sequence)
      end

      it "re-renders the 'edit' template" do
        Sequence.stub!(:find).and_return(mock_sequence(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sequence" do
      Sequence.should_receive(:find).with("37").and_return(mock_sequence)
      mock_sequence.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sequences list" do
      Sequence.stub!(:find).and_return(mock_sequence(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(sequences_url)
    end
  end

end
