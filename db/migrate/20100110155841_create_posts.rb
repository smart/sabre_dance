class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :post_type, :null => false
      t.string :author, :url
      t.text :summary, :title
      t.datetime :published
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
