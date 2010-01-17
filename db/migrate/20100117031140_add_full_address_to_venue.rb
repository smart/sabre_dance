class AddFullAddressToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :full_address, :string
  end

  def self.down
    remove_column :venues, :string
  end
end
