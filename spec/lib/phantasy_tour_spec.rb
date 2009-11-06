require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhantasyTour do
  before do
    @pt = PhantasyTour.new
  end

  it "should instantiate without a problem" do
    @pt.class.should == PhantasyTour
  end

  describe "#song_info_from_id" do
    file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "song_37.html")).to_s
    FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/songs.cgi?songID=37", :content_type => "text/html", :code => 200, :body => file_body)

    it "should return a hash of song info if valid id" do
      valid_id = 37
      ret_hash = @pt.song_info_from_id(valid_id)
      ret_hash.should == {:name => "House Dog Party Favor",
                          :pt_nickname => "House Dog",
                          :pt_id => 37,
                          :author => "The Disco Biscuits",
                          :original => true}
    end

    it "should raise a record not found ezxeption if id doesn't exist" do
      invalid_id = 900000
      lambda{ @pt.song_info_from_id(invalid_id) }.should raise_error
    end

  end

  describe "#show_info_from_id" do
    file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "show_1167.html")).to_s
    FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/shows.cgi?showID=1167", :content_type => "text/html", :code => 200, :body => file_body)

    it "should return a hash of show info if valid id" do
      valid_id = 1167
      ret_hash = @pt.show_info_from_id(valid_id)
      ret_hash.should == {:pt_id => 1167,
                          :date => Date.parse("Saturday, October, 10, 2009"),
                          :pt_tour_id => 39,
                          :pt_venue_id => 1356,
                          :venue_name => "Calvin Theatre",
                          :tour_name => "Fall Tour 2009",
                          :show_setlist=>[
                                          {:name=>"Set I:", :songs=>[{:segue=>true, :pt_song_id=>304, :notes=>[], :note_numbers=>[], :name=>"Papercut"},
                                                                     {:segue=>false, :pt_song_id=>56, :notes=>[], :note_numbers=>[], :name=>"Mr. Don"},
                                                                     {:segue=>false, :pt_song_id=>353, :notes=>["1st time played"], :note_numbers=>[1], :name=>"On Time"},
                                                                     {:segue=>true, :pt_song_id=>37, :notes=>[], :note_numbers=>[], :name=>"House Dog Party Favor"},
                                                                     {:segue=>true, :pt_song_id=>288, :notes=>[], :note_numbers=>[], :name=>"Air Song"},
                                                                     {:segue=>false, :pt_song_id=>37, :notes=>[], :note_numbers=>[], :name=>"House Dog Party Favor"}]},
                                          {:name=>"Set II:", :songs=>[{:segue=>true, :pt_song_id=>206, :notes=>[], :note_numbers=>[], :name=>"42"},
                                                                      {:segue=>true, :pt_song_id=>259, :notes=>[], :note_numbers=>[], :name=>"Tempest"},
                                                                      {:segue=>true, :pt_song_id=>38, :notes=>[], :note_numbers=>[], :name=>"Humuhumunukunukuapua'a"},
                                                                      {:segue=>true, :pt_song_id=>272, :notes=>[], :note_numbers=>[], :name=>"Boom Shanker"},
                                                                      {:segue=>true, :pt_song_id=>73, :notes=>["inverted"], :note_numbers=>[2], :name=>"Shelby Rose"},
                                                                      {:segue=>false, :pt_song_id=>206, :notes=>[], :note_numbers=>[], :name=>"42"}]},
                                          {:name=>"Encore:", :songs=>[{:segue=>false, :pt_song_id=>32, :notes=>[], :note_numbers=>[], :name=>"Highwire"},
                                                                      {:segue=>false, :pt_song_id=>354, :notes=>["1st time played (Beastie Boys)"], :note_numbers=>[3], :name=>"No Sleep Till Brooklyn"}]}
                                        ]
                          }
    end
  end

  describe "#venue_info_from_id" do
    file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "venue_1356.html")).to_s
    FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/venues.cgi?venueID=1356", :content_type => "text/html", :code => 200, :body => file_body)

    it "should return a hash of venue info from a valid id" do
      valid_id = 1356
      ret_hash = @pt.venue_info_from_id(valid_id)
      ret_hash.should == {:pt_id=>1356, :website=>"www.calvintheater.com/", :map=>"http://maps.yahoo.com/py/maps.py?addr=19 King Street&\n      csz=Northampton+MA&country=", :state=>"MA", :city=>"Northampton", :name=>"Calvin Theatre"}
    end
  end

  describe "#tour_info_from_id" do
    file_body = File.read(File.join(RAILS_ROOT, "spec", "responses", "tour_39.html")).to_s
    FakeWeb.register_uri(:get, "http://www.phantasytour.com/bisco/tours.cgi?tourID=39", :content_type => "text/html", :code => 200, :body => file_body)

    it "should return a hash of tour info from a tour id" do
      valid_id = 39
      ret_hash = @pt.tour_info_from_id(valid_id)
      ret_hash.should  == {:name => "Fall Tour 2009", :pt_id => 39}
    end
  end


end