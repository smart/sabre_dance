class Show < ActiveRecord::Base
  has_many :show_set_lists, :order => :position
  has_many :set_lists, :through => :show_set_lists
  has_many :song_performances, :through => :set_lists
  has_many :songs, :through => :set_lists
  has_many :fan_requests
  belongs_to :tour
  belongs_to :venue

  validates_presence_of :date
  validates_uniqueness_of :pt_id

  #before_save :ensure_venue

  named_scope :upcoming, :conditions => ["shows.date >= ?", Date.today]
  named_scope :played, :conditions => ["shows.date < ?", Date.today]

  def self.find_or_create_by_pt_id(id)
    find_by_pt_id(id) || create_by_pt_id(id)
  end

  def self.create_by_pt_id(id)
    #pt_data = PhantasyTour.new.show_info_from_id(id)
    show = new(:pt_id => id)
    show.set_pt_show_info
    show.set_pt_set_list
    show.save!
    show
  end

  def scan_for_sequences(force = false)
    return true if (!force && scanned_for_sequences?)
    set_lists.each(&:scan_for_sequences)
    update_attribute(:scanned_for_sequences, true)
  end

  def update_pt_show_info
    set_pt_show_info
    save
  end

  def update_pt_set_list
    set_pt_set_list
    save
  end

  def set_pt_show_info
    self.date = pt_info[:date]
    self.name = pt_info[:show_name]
    self.pt_id = pt_info[:pt_id]
    self.tour = Tour.find_or_create_by_pt_id(pt_info[:pt_tour_id]) if pt_info[:pt_tour_id].to_i > 0
    self.venue = Venue.find_or_create_by_pt_id(pt_info[:pt_venue_id]) if pt_info[:pt_venue_id].to_i > 0
  end

  def set_pt_set_list
    self.show_set_list_from_pt_data(pt_info[:show_setlist])
  end

  def show_set_list_from_pt_data(setlist_data)
    self.set_lists.destroy_all
    setlist_data.each do |list|
      self.set_lists << SetList.new_from_pt_data(list)
    end
  end

  def upcoming?
    date >= Date.today
  end

  def default_set_lists
    return true unless set_lists.empty?
    ["Set I", "Set II", "Encore"].each do |set|
      self.show_set_lists << ShowSetList.new(:name => set, :set_list => SetList.new(:name => set))
    end
    save
  end

  def pt_info
   @pt_data ||= PhantasyTour.new.show_info_from_id(pt_id)
  end

  def ensure_venue
    self.tour ||= Tour.find_or_create_by_pt_id(pt_info[:pt_tour_id]) if pt_info[:pt_tour_id].to_i > 0
  end
end
