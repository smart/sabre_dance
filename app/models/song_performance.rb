class SongPerformance < ActiveRecord::Base
  belongs_to :set_list
  belongs_to :song
  acts_as_list :scope => :set_list
  acts_as_taggable_on :tags

  validates_presence_of :song

  def self.new_from_pt_data(pt_data)
    sp = new
    sp.segue = pt_data[:segue]
    sp.tag_list = pt_data[:notes] #.join(", ")
    sp.song = Song.find_or_create_by_pt_id(pt_data[:pt_song_id])
    sp
  end
end