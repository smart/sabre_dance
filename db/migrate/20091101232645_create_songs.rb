class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name, :pt_nickname, :author
      t.integer :pt_id
      t.integer :estimated_duration
      t.boolean :active, :default => true
      t.boolean :original, :default => true
      t.integer :band_rank, :fan_rank
      t.timestamps
    end
    add_index(:songs, :name)
    add_index(:songs, :pt_id)
  end

  def self.down
    drop_table :songs
  end
end
