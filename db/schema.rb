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

ActiveRecord::Schema.define(version: 20160703162212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: :cascade do |t|
    t.boolean  "active",               default: true, null: false
    t.datetime "start_time",                          null: false
    t.datetime "end_time",                            null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "schedules_id"
    t.integer  "tenant_user_roles_id"
    t.index ["schedules_id"], name: "index_lessons_on_schedules_id", using: :btree
    t.index ["tenant_user_roles_id"], name: "index_lessons_on_tenant_user_roles_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "lookup_code", limit: 30,                null: false
    t.string   "name",        limit: 30,                null: false
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["lookup_code"], name: "index_roles_on_lookup_code", unique: true, using: :btree
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.boolean  "active",     default: true, null: false
    t.date     "start_date",                null: false
    t.date     "end_date",                  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "tenants_id"
    t.index ["tenants_id"], name: "index_schedules_on_tenants_id", using: :btree
  end

  create_table "tenant_locations", force: :cascade do |t|
    t.string   "address1",   limit: 255,                null: false
    t.string   "address2",   limit: 255
    t.string   "address3",   limit: 255
    t.string   "city",       limit: 60,                 null: false
    t.string   "state_code", limit: 2,                  null: false
    t.string   "zip_code",   limit: 9,                  null: false
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "tenants_id"
    t.index ["tenants_id"], name: "index_tenant_locations_on_tenants_id", using: :btree
  end

  create_table "tenant_user_roles", force: :cascade do |t|
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "tenants_id"
    t.integer  "users_id"
    t.integer  "roles_id"
    t.index ["roles_id"], name: "index_tenant_user_roles_on_roles_id", using: :btree
    t.index ["tenants_id"], name: "index_tenant_user_roles_on_tenants_id", using: :btree
    t.index ["users_id"], name: "index_tenant_user_roles_on_users_id", using: :btree
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name",       limit: 400,                null: false
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["name"], name: "index_tenants_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",    limit: 30,                 null: false
    t.string   "last_name",     limit: 40,                 null: false
    t.string   "email_address", limit: 200,                null: false
    t.boolean  "active",                    default: true, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "lessons", "schedules", column: "schedules_id"
  add_foreign_key "lessons", "tenant_user_roles", column: "tenant_user_roles_id"
  add_foreign_key "schedules", "tenants", column: "tenants_id"
  add_foreign_key "tenant_locations", "tenants", column: "tenants_id"
  add_foreign_key "tenant_user_roles", "roles", column: "roles_id"
  add_foreign_key "tenant_user_roles", "tenants", column: "tenants_id"
  add_foreign_key "tenant_user_roles", "users", column: "users_id"
end
