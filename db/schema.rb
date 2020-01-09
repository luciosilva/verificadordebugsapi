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

ActiveRecord::Schema.define(version: 20200107220919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.string   "name",          limit: 200
    t.string   "title",         limit: 150
    t.string   "url",           limit: 200
    t.datetime "dt_created"
    t.datetime "dt_resolution"
    t.string   "subproject",    limit: 250
    t.string   "environment",   limit: 150
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "bugs_groups_configs", force: :cascade do |t|
    t.integer "bug_id"
    t.integer "groups_config_id"
    t.index ["bug_id"], name: "index_bugs_groups_configs_on_bug_id", using: :btree
    t.index ["groups_config_id"], name: "index_bugs_groups_configs_on_groups_config_id", using: :btree
  end

  create_table "bugs_histories", force: :cascade do |t|
    t.string   "name",                limit: 200
    t.string   "title",               limit: 150
    t.string   "url",                 limit: 200
    t.datetime "dt_created"
    t.datetime "dt_resolution"
    t.string   "subproject",          limit: 250
    t.string   "environment",         limit: 150
    t.integer  "id_groups_configs"
    t.string   "name_groups_configs", limit: 150
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bugs_history_id"
    t.text     "message"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["bugs_history_id"], name: "index_comments_on_bugs_history_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "groups_configs", force: :cascade do |t|
    t.text     "tfs_query"
    t.string   "name"
    t.integer  "tfs_config_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tfs_config_id"], name: "index_groups_configs_on_tfs_config_id", using: :btree
  end

  create_table "groups_configs_users", force: :cascade do |t|
    t.integer "groups_config_id"
    t.integer "user_id"
    t.index ["groups_config_id"], name: "index_groups_configs_users_on_groups_config_id", using: :btree
    t.index ["user_id"], name: "index_groups_configs_users_on_user_id", using: :btree
  end

  create_table "tfs_configs", force: :cascade do |t|
    t.string   "connection_string"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 100
    t.string   "password",   limit: 40
    t.string   "name",       limit: 100
    t.string   "emails",     limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "bugs_histories"
  add_foreign_key "comments", "users"
  add_foreign_key "groups_configs", "tfs_configs"
end
