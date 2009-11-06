class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.integer :pt_id
      t.string :name, :street1, :street2, :city, :state, :zip, :country, :phone, :website
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
