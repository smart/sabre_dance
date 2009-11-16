class CreateSongPerformances < ActiveRecord::Migration
  def self.up
    create_table :song_performances do |t|
      t.belongs_to :song
      t.belongs_to :set_list
      t.integer :position
      t.string :notes
      t.boolean :segue, :null => false, :default => false
      t.timestamps
    end
    add_index(:song_performances, :song_id)
    add_index(:song_performances, :set_list_id)
  end

  def self.down
    drop_table :song_performances
  end
end
