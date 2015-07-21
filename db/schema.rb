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

ActiveRecord::Schema.define(version: 20150721005925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "categories", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "components", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "stock",        default: 0,  null: false
    t.text     "description",  default: "", null: false
    t.string   "model",        default: "", null: false
    t.string   "manufacturer"
    t.string   "datasheet",    default: "", null: false
    t.string   "image_link"
    t.jsonb    "status",       default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "category_id"
    t.uuid     "toolbox_id"
  end

  add_index "components", ["name"], name: "index_components_on_name", unique: true, using: :btree
  add_index "components", ["status"], name: "index_components_on_status", using: :gin

  create_table "items", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.integer  "quantity",                 null: false
    t.string   "useful_for"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "category_id"
    t.uuid     "toolbox_id"
  end

  add_index "items", ["name"], name: "index_items_on_name", unique: true, using: :btree

  create_table "pelegos", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "pelegos", ["email"], name: "index_pelegos_on_email", unique: true, using: :btree
  add_index "pelegos", ["reset_password_token"], name: "index_pelegos_on_reset_password_token", unique: true, using: :btree

  create_table "toolboxes", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.string   "location",                 null: false
    t.string   "owner"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
