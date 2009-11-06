# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091104034834) do

  create_table "set_lists", :force => true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "notes"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_set_lists", :force => true do |t|
    t.integer  "show_id"
    t.integer  "set_list_id"
    t.integer  "position"
    t.string   "name"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", :force => true do |t|
    t.integer  "pt_id"
    t.integer  "tour_id"
    t.integer  "venue_id"
    t.string   "name"
    t.date     "date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "song_performances", :force => true do |t|
    t.integer  "song_id"
    t.integer  "set_list_id"
    t.integer  "position"
    t.string   "notes"
    t.boolean  "segue",       :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.string   "pt_nickname"
    t.string   "author"
    t.integer  "pt_id"
    t.integer  "estimated_duration"
    t.boolean  "active",             :default => true
    t.boolean  "original",           :default => true
    t.integer  "band_rank"
    t.integer  "fan_rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tours", :force => true do |t|
    t.string   "name"
    t.integer  "pt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.integer  "pt_id"
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
