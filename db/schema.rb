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

ActiveRecord::Schema.define(version: 20130828193811) do

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preview"
  end

  create_table "balls", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds_users", id: false, force: true do |t|
    t.integer "feed_id"
    t.integer "user_id"
  end

  create_table "reading_articles", force: true do |t|
    t.boolean  "read",       default: false
    t.boolean  "like",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "feed_id"
    t.integer  "article_id"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_migrations", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "subscription_id"
  end

end
