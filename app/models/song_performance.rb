class SongPerformance < ActiveRecord::Base
  belongs_to :set_list
  belongs_to :song
  belongs_to :sequence
  acts_as_list :scope => :set_list
  acts_as_taggable_on :tags

  delegate :show, :to => :set_list

  validates_presence_of :song

  default_scope :order => "song_performances.position asc"

  def self.new_from_pt_data(pt_data)
    sp = new
    sp.segue = pt_data[:segue]
    sp.tag_list = pt_data[:notes] #.join(", ")
    sp.song = Song.find_or_create_by_pt_id(pt_data[:pt_song_id])
    sp
  end

  def inverted?
    tag_list.any?{|tg| tg.downcase.include?("inverted") }
  end

end
