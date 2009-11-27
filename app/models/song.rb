class Song < ActiveRecord::Base
  validates_presence_of :name
  has_many :song_performances
  has_many :fan_requests
  validates_presence_of :name
  validates_uniqueness_of :pt_id, :allow_nil => true

  named_scope :by_frequency, :select => "songs.id, songs.name, count(song_performances.id) as plays",
                             :joins => :song_performances, :group => "songs.id, songs.name "

  named_scope :tour_frequency, :select => "songs.name as name, songs.id as id, COUNT(song_performances.song_id) as plays",
                              :order => "plays desc",
                              :joins => [{:song_performances => {:set_list => {:show_set_list => :show}}}],
                              :conditions => ["tour_id = ?", id], :group => "songs.id, songs.name"

  named_scope :played_at_venues, lambda{|venues|
                                  { :select => "songs.name, songs.id, COUNT(song_performances.id) as plays, MAX(shows.date) as last_played_on",
                                    :joins => {:song_performances => {:set_list => {:show_set_list => {:show => :venue}}}},
                                    :conditions => ["venues.id IN (?)", venues],
                                    :group => "songs.id, songs.name"}}

  named_scope :not_yet_played, {:select => "songs.id, songs.name", :joins => "LEFT OUTER JOIN song_performances ON songs.id  = song_performances.song_id",  :group => "songs.name, songs.id", :conditions => "song_performances.id IS NULL"}

  named_scope :originals, {:conditions => {:original => true} }
  named_scope :covers, {:conditions => {:original => false} }

  named_scope :order_by_plays, :order => "plays desc"

  named_scope :requested_for_show, lambda{ |show_id|
                                     {:select => "songs.name as name, songs.id as id, COUNT(fan_requests.song_id) as plays",
                                      :order => "plays desc",:joins => :fan_requests,
                                      :conditions => ["fan_requests.show_id = ?", show_id], :group => "songs.id, songs.name" }}



  def self.played_in_radius(address, radius = 40)
    venues = Venue.find(:all, :origin => address, :within => radius)
    played_at_venues(venues)
  end

  def self.played_near_recently(address, radius = 40, date_back = 3.years.ago )
    venues = Venue.find(:all, :origin => address, :within => radius)
    played_at_venues(venues).find(:all, :conditions => ["shows.date > ?", date_back])
  end

  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
  end


  def self.create_by_pt_id(id)
    pt_data = PhantasyTour.new.song_info_from_id(id)
    song = new(pt_data)
    song.save!
    song
  end

  def phantasy_tour
    @pt ||= PhantasyTour.new
  end


end
