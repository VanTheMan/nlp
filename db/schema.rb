# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120927024629) do

  create_table "scripts", :force => true do |t|
    t.text     "e_content",     :limit => 255
    t.text     "v_content",     :limit => 255
    t.integer  "script_number"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "scripts", ["created_at"], :name => "index_scripts_on_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "num_translate"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
