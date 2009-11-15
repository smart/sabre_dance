class Show < ActiveRecord::Base
  has_many :show_set_lists, :order => :position
  has_many :set_lists, :through => :show_set_lists
  has_many :song_performances, :through => :set_lists
  has_many :songs, :through => :set_lists
  belongs_to :tour
  belongs_to :venue

  validates_presence_of :date
  validates_uniqueness_of :pt_id

  before_save :ensure_venue

  named_scope :upcoming, :conditions => ["shows.date >= ?", Date.today]
  named_scope :played, :conditions => ["shows.date < ?", Date.today]

  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
  end

  def self.create_by_pt_id(id)
    pt_data = PhantasyTour.new.show_info_from_id(id)
    show = new
    show.date = pt_data[:date]
    show.pt_id = pt_data[:pt_id]
    show.tour = Tour.find_or_create_by_pt_id(pt_data[:pt_tour_id]) if pt_data[:pt_tour_id].to_i > 0
    show.venue = Venue.find_or_create_by_pt_id(pt_data[:pt_venue_id]) if pt_data[:pt_venue_id].to_i > 0
    show.show_set_list_from_pt_data(pt_data[:show_setlist])
    show.set_lists.each{|de| p de.songs }
    show.save!
    show
  end

  def show_set_list_from_pt_data(setlist_data)
    setlist_data.each do |list|
      self.set_lists << SetList.new_from_pt_data(list)
    end
  end

  def pt_info
   @pt_data ||= PhantasyTour.new.show_info_from_id(pt_id)
  end

  def ensure_venue
    self.tour ||= Tour.find_or_create_by_pt_id(pt_info[:pt_tour_id]) if pt_info[:pt_tour_id].to_i > 0
  end
end
