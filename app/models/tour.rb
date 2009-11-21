class Tour < ActiveRecord::Base
  has_many :shows
  has_many :songs, :through => :shows
  validates_presence_of :name
  validates_uniqueness_of :pt_id

  named_scope :by_date_of_first_show, lambda {
    {:select => "tours.*, MIN(shows.date) as first_show_date", :joins => "LEFT OUTER JOIN shows ON tours.id = shows.tour_id", :group => "tours.id, tours.name, tours.pt_id, tours.created_at, tours.updated_at", :order => "first_show_date desc"}
  }

  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
  end

  def self.create_by_pt_id(id)
    pt_data = PhantasyTour.new.tour_info_from_id(id)

    tour = new
    tour.name = pt_data[:name]
    tour.pt_id = pt_data[:pt_id]
    tour.save!
    tour
  end

  def song_stats
    Song.find(:all, :select => "songs.name as name, songs.id as id, COUNT(song_performances.song_id) as plays", :order => "plays desc", :joins => [{:song_performances => {:set_list => {:show_set_list => :show}}}], :conditions => ["tour_id = ?", id], :group => "songs.id, songs.name")
    #SongPerformance.find(:all, :select => "songs.name as name, songs.id as id, COUNT(song_performances.song_id) as plays", :order => "plays desc", :joins => [{:set_list => {:show_set_list => :show}}, :song], :conditions => ["tour_id = ?", id], :group => "song_performances.song_id")
    #songs.find(:all, :select => "songs.*, COUNT(songs.id) as plays", :group => "song.id", :order => "plays desc")
  end
end
