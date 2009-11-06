class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.integer :pt_id
      t.belongs_to  :tour
      t.belongs_to  :venue
      t.string :name
      t.date :date
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
