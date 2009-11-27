class CreateSequences < ActiveRecord::Migration
  def self.up
    create_table :sequences do |t|
      t.column :name, :string
      t.belongs_to :show, :null => false
      t.belongs_to :set_list, :null => false
      t.integer :first_song_performance_id, :null => false
    end
    add_column :song_performances, :sequence_id, :integer
    add_column :shows, :scanned_for_sequences, :boolean, :default => false
  end

  def self.down
    drop_table    :sequences
    remove_column :song_performances, :sequence_id
    remove_column :shows, :scanned_for_sequences
  end
end
