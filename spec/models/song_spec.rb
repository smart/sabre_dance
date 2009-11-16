require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  before(:each) do

  end

  it "should create a new instance given valid attributes" do
    Factory(:song).should be_valid
  end

  describe "#create_from_pt_id" do

    it "should be able to create a valid model from pt id" do
       song = Song.create_by_pt_id(37)
      house_dog = Factory(:song, :pt_id => 300)
      song.should be_valid
      song.name.should == house_dog.name
    end

  end

  it "should be able to return songs in the most played order" do
    song_1 = Factory(:song, :name => "Sound 1")
    song_2 = Factory(:song, :name => "42")
    (1..4).each {|i| Factory(:song_performance, :song => song_1)}
    (1..2).each {|i| Factory(:song_performance, :song => song_2)}

    songs = Song.by_frequency
    songs.first.should == song_1
    songs.first.plays == 4
    songs.second.should == song_2
    songs.second.plays == 2
  end

  describe 'searching for songs played in an radius' do
    before do
      @song1 = Factory(:song)
      @song2 = Factory(:song, :name => "Sweet Nothings")
      @song3 = Factory(:song, :name => "Awesome Sauce")
      @venue1 = Factory(:venue, :name => "Steve Theater", :city => "New York", :state => "NY")
      @venue2 = Factory(:venue, :name => "Bill Theater", :city => "New York", :state => "NY")
      @venue3 = Factory(:venue, :name => "Somewhere Else", :city => "Philadelphia", :state => "PA")
      @show1 = Factory(:show, :venue => @venue1, :date => 15.days.ago, :set_lists => [SetList.new(:songs => [@song1, @song2])])
      @show2 = Factory(:show, :venue => @venue2, :date => 20.days.ago, :set_lists => [SetList.new(:songs => [@song1])])
      @show2 = Factory(:show, :venue => @venue3, :date => 40.days.ago, :set_lists => [SetList.new(:songs => [@song3])])
    end

    it "should find 2 venues in a 20 mile radius" do
      Venue.find(:all, :origin => "New York, NY", :within => 20).count.should == 2
    end

    it "should be able to search for songs by a location and return all the performances by songs and last played" do
      venues = Venue.find(:all, :origin => "New York, NY", :within => 20)
      songs  = Song.played_at_venues(venues)
      p songs
      p songs.first.plays
      p songs.first.last_played_on
      songs.size.should == 2
    end
  end


end
