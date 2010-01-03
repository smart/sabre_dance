class SetList < ActiveRecord::Base
  has_many :song_performances , :order => :position
  has_many :songs, :through => :song_performances
  has_one :show_set_list
  has_many :shows, :through => :show_set_lists
  delegate :show, :to => :show_set_list
  has_many :sequences


  def self.new_from_pt_data(setlist_data)
    setlist = new
    setlist.name  = setlist_data[:name]
    setlist_data[:songs].each do |song|
      setlist.song_performances << SongPerformance.new_from_pt_data(song)
    end
    setlist.save!
    setlist
  end

  def scan_for_sequences
    Sequence.transaction do
      sequences.destroy_all
      current_sequence = nil
      song_performances.each do |sp|
        if (sp.segue || sp.higher_item.try(:segue))
          current_sequence ||= Sequence.find_or_create_by_first_song_performance_id(:first_song_performance_id => sp.id, :set_list_id => id, :show_id => show.id)
          current_sequence.song_performances << sp
        else
          current_sequence = nil
        end
      end
    end
  end

end
