class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :thumbnail_2, :thumbnail_3, :title, :thumbnail_1
      t.string :photo, :null => false
      t.belongs_to :photo_album, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
