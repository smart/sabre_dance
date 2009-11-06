require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Show do

  it "should create a new instance given valid attributes" do
    Factory(:show).should be_valid
  end

  describe "#create_from_pt_id" do

    it "should create a valid show from a pt id " do
      #better to stub this in model
      house_dog = Factory(:show)
      pt_id = 1167
      show = Show.create_from_pt_id(pt_id)
      show.should be_valid
      show.date.should == house_dog.date
    end
  end

  it "should create a setlist from a valid array" do
    setlist_data = [
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

    show = Factory(:show)
    show.show_set_list_from_pt_data(setlist_data)
    show.set_lists.size.should == 3

  end
end
