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

ActiveRecord::Schema.define(:version => 20110405152823) do

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "recipient_email"
    t.string   "subject"
    t.text     "content"
    t.string   "state",           :default => "new"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "acceptor_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "fullname"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
