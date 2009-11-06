class CreateSetLists < ActiveRecord::Migration
  def self.up
    create_table :set_lists do |t|
      t.string :name
      t.string :author
      t.string :notes
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :set_lists
  end
end
