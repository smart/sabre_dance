class Sequence < ActiveRecord::Base
  belongs_to :show
  belongs_to :set_list
  belongs_to :first_song_performance, :class_name => "SongPerformance", :foreign_key => "first_song_performance_id"
  has_many :song_performances #, :unique => true

  named_scope :formatted, { :select => "DISTINCT ON (first_song_performance_id) sequences.*, songs.*, tags.*, shows.*", :include => [{:song_performances => [:tags, :song]}, :show], :order => "shows.date desc"}
end
