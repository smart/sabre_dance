class FanRequest < ActiveRecord::Base
  belongs_to :song
  belongs_to :show
end
