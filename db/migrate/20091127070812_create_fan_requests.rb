class CreateFanRequests < ActiveRecord::Migration
  def self.up
    create_table :fan_requests do |t|
      t.belongs_to :show, :null => false
      t.string :requested_by
      t.belongs_to :song
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :fan_requests
  end
end
