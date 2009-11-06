class CreateShowSetLists < ActiveRecord::Migration
  def self.up
    create_table :show_set_lists do |t|
      t.belongs_to :show
      t.belongs_to :set_list
      t.integer :position
      t.string :name
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :show_set_lists
  end
end
