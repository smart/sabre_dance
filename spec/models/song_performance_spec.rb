require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongPerformance do

  it "should create a new instance given valid attributes" do
    Factory(:song_performance).should be_valid
  end

  it "should be able o be created from pt data" do
    sp_data = {:segue=>true, :pt_song_id=>37, :notes=>[], :note_numbers=>[], :name=>"House Dog Party Favor"}
    sp = SongPerformance.new_from_pt_data(sp_data)
    sp.song = Factory(:song)
  end
end
