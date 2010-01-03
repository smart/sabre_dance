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

  def tag_list_string
    tag_list.reject{|tag| tag =~ /nvert/}.join("#;")
  end

  def info
    "#{set}%^#{position}%^#{segue? ? 1 : 0}%^#{inverted? ? 1 : 0}%^#{notes}%^#{tag_list_string}"
  end

  def set
    set_list.try(:show_set_list).try(:position)
  end

  def show_id
    set_list.try(:show_set_list).try(:show_id)
  end

  def to_json(opts)
    opts.merge!(:only => [:id, :song_id], :methods =>[ :show_id, :info])
    super(opts)
  end

  def to_set_list_hash
    hashr = {}
    hashr[:song_id] = song_id
    hashr[:song_name] = song.name
    hashr[:segue] = segue?
    hashr[:inverted] = tag_list.any?{|tag| tag =~ /nvert/}
    hashr[:tag_list_string] = tag_list_string
    hashr[:notes] = notes
    hashr[:position] = position
    hashr
  end

end
