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

ActiveRecord::Schema.define(version: 20140412200721) do

  create_table "articles", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preview"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "index"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balls", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "r"
    t.text     "verb"
    t.integer  "subject_id"
    t.text     "subject_type"
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

  create_table "notifications", force: true do |t|
    t.text     "type"
    t.string   "recipient_id"
    t.text     "arguments"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "relationships", force: true do |t|
    t.integer  "obj_id"
    t.integer  "subj_id"
    t.text     "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions_users", id: false, force: true do |t|
    t.integer "subscription_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "username"
    t.text     "provider"
    t.text     "uid"
    t.boolean  "uploaded_pic"
  end

  add_index "users", ["email", "provider", "uid"], name: "index_users_on_identity", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_migrations", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "subscription_id"
  end

end
