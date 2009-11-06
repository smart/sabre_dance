require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SetList do
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    SetList.create!(@valid_attributes)
  end

  it "should create from pt data" do
    setlist_data = {:name=>"Set I:", :songs=>[{:segue=>true, :pt_song_id=>37, :notes=>[], :note_numbers=>[], :name=>"House Dog Party Favor"}]}
    setlist = SetList.new_from_pt_data(setlist_data)
    setlist.song_performances.size.should == 1
    setlist.save
    setlist.should be_true
  end
end
