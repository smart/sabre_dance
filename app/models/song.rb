class Song < ActiveRecord::Base
  validates_presence_of :name
  has_many :song_performances
  validates_uniqueness_of :pt_id

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