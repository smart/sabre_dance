class CreatePhotoAlbums < ActiveRecord::Migration
  def self.up
    create_table :photo_albums do |t|
      t.string :title, :credit
      t.date :date
      t.string :thumbnail, :photo
      t.bigint :picasa_id
      t.belongs_to :show
      t.belongs_to :venue
      t.timestamps
    end
  end

  def self.down
    drop_table :photo_albums
  end
end
