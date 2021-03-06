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

ActiveRecord::Schema.define(:version => 20130409210901) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "url"
    t.integer  "karma"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"
  add_index "articles", ["title"], :name => "index_articles_on_title"

  create_table "comment_ancestries", :force => true do |t|
    t.integer  "descendant_id"
    t.integer  "ancestor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comment_ancestries", ["ancestor_id"], :name => "index_comment_ancestries_on_ancestor_id"
  add_index "comment_ancestries", ["descendant_id"], :name => "index_comment_ancestries_on_descendant_id"

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "article_id"
    t.integer  "parent_comment_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"
  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "remember_token"
    t.integer  "karma"
    t.text     "about"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "email"
    t.string   "password"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
