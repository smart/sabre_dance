class SetList < ActiveRecord::Base
  has_many :song_performances
  has_many :songs, :through => :song_performances
  has_many :show_set_lists
  has_many :shows, :through => :show_set_lists

  def self.new_from_pt_data(setlist_data)
    setlist = new
    setlist.name  = setlist_data[:name]
    setlist_data[:songs].each do |song|
      setlist.song_performances << SongPerformance.new_from_pt_data(song)
    end
    setlist.save!
    setlist
  end
end
