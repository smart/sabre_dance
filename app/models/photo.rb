class Photo < ActiveRecord::Base
  belongs_to :photo_album

  def thumbnail
    thumbnail_1 || thumbnail_2 || thumbnail_3
  end
end
