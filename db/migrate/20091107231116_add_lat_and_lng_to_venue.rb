class AddLatAndLngToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :lat, :decimal, :precision => 15, :scale => 10
    add_column :venues, :lng, :decimal, :precision => 15, :scale => 10

    add_index(:venues, [:lat, :lng])
  end



  def self.down
    remove_column :venues, :lat
    remove_column :venues, :lng
  end
end
