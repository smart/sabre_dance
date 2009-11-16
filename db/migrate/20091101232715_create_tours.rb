class CreateTours < ActiveRecord::Migration
  def self.up
    create_table :tours do |t|
      t.string :name
      t.integer :pt_id
      t.timestamps
    end
    add_index(:tours, :pt_id)
    add_index(:tours, :name)
  end

  def self.down
    drop_table :tours
  end
end
