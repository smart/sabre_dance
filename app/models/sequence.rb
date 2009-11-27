class Sequence < ActiveRecord::Base
  belongs_to :show
  belongs_to :set_list
  belongs_to :first_song_performance, :class_name => "SongPerformance", :foreign_key => "first_song_performance_id"
  has_many :song_performances #, :unique => true


end
