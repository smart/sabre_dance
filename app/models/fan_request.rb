class FanRequest < ActiveRecord::Base
  belongs_to :song
  belongs_to :show
  validates_presence_of :song_id, :show_id
end
