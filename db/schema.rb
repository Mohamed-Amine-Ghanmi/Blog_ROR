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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160201104543) do

  create_table "comments", force: true do |t|
    t.text     "message"
    t.boolean  "status"
    t.integer  "post_id"
    t.integer  "visitor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["visitor_id"], name: "index_comments_on_visitor_id"

  create_table "messages", force: true do |t|
    t.text     "content"
    t.integer  "visitor_id"
    t.boolean  "status",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    
  end

  add_index "messages", ["visitor_id"], name: "index_messages_on_visitor_id"

  create_table "moderators", force: true do |t|
    t.string   "fullname"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notifiable_id", "notifiable_type"], name: "index_notifications_on_notifiable_id_and_notifiable_type"

  create_table "post_tags", force: true do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_tags", ["post_id"], name: "index_post_tags_on_post_id"
  add_index "post_tags", ["tag_id"], name: "index_post_tags_on_tag_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.integer  "moderator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["moderator_id"], name: "index_posts_on_moderator_id"

  create_table "settings", force: true do |t|
    t.string   "site_name"
    t.integer  "post_per_page"
    t.boolean  "under_maintenance"
    t.boolean  "prevent_commenting"
    t.boolean  "tag_visibility"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", force: true do |t|
    t.string   "fullname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
