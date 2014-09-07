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

ActiveRecord::Schema.define(:version => 20140907042356) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.float    "52_week_high"
    t.float    "52_week_low"
    t.integer  "cash"
    t.float    "shares_out"
    t.integer  "burn"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "ticker"
    t.integer  "three_month_volume"
    t.text     "other"
    t.float    "debt"
    t.date     "debt_due"
  end

  create_table "companies_info_snippets", :id => false, :force => true do |t|
    t.integer "company_id",      :null => false
    t.integer "info_snippet_id", :null => false
  end

  add_index "companies_info_snippets", ["info_snippet_id", "company_id"], :name => "index_companies_info_snippets_on_info_snippet_id_and_company_id", :unique => true

  create_table "companies_programs", :id => false, :force => true do |t|
    t.integer "company_id", :null => false
    t.integer "program_id", :null => false
  end

  add_index "companies_programs", ["company_id", "program_id"], :name => "index_companies_programs_on_company_id_and_program_id", :unique => true

  create_table "info_snippets", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "event_date"
    t.text     "subject"
  end

  create_table "info_snippets_programs", :id => false, :force => true do |t|
    t.integer "info_snippet_id", :null => false
    t.integer "program_id",      :null => false
  end

  add_index "info_snippets_programs", ["info_snippet_id", "program_id"], :name => "index_info_snippets_programs_on_info_snippet_id_and_program_id", :unique => true

  create_table "info_snippets_tags", :id => false, :force => true do |t|
    t.integer "info_snippet_id", :null => false
    t.integer "tag_id",          :null => false
  end

  add_index "info_snippets_tags", ["info_snippet_id", "tag_id"], :name => "index_info_snippets_tags_on_info_snippet_id_and_tag_id", :unique => true

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programs_tags", :id => false, :force => true do |t|
    t.integer "program_id", :null => false
    t.integer "tag_id",     :null => false
  end

  add_index "programs_tags", ["program_id", "tag_id"], :name => "index_programs_tags_on_program_id_and_tag_id", :unique => true

  create_table "tag_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.integer  "tag_type_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
