class Song < ActiveRecord::Base
  validates_presence_of :name
  has_many :song_performances
  validates_uniqueness_of :pt_id

  named_scope :by_frequency, :select => "songs.*, count(song_performances.id) as plays",
                             :joins => :song_performances, :group => "songs.id"

  named_scope :tour_frequency, :select => "songs.name as name, songs.id as id, COUNT(song_performances.song_id) as plays",
                              :order => "plays desc",
                              :joins => [{:song_performances => {:set_list => {:show_set_list => :show}}}],
                              :conditions => ["tour_id = ?", id], :group => "songs.id, songs.name"

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
