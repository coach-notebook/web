# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_15_090839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "drills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "library_id", null: false
    t.string "name"
    t.text "body"
    t.integer "duration_minutes"
    t.string "tags", default: [], array: true
    t.string "number_of_players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "variations", default: [], array: true
    t.string "keys", array: true
    t.string "goals", array: true
    t.index ["library_id"], name: "index_drills_on_library_id"
  end

  create_table "libraries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "squad_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_players_on_squad_id"
  end

  create_table "plays", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "library_id"
    t.string "name"
    t.text "notes"
    t.integer "court", default: 0
    t.jsonb "phases", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_plays_on_library_id"
  end

  create_table "practice_drills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "practice_id", null: false
    t.uuid "drill_id", null: false
    t.integer "position"
    t.datetime "run_at"
    t.string "variation"
    t.integer "rating", default: 0
    t.index ["drill_id"], name: "index_practice_drills_on_drill_id"
    t.index ["practice_id"], name: "index_practice_drills_on_practice_id"
  end

  create_table "practices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "practice_at"
    t.uuid "squad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "review"
    t.index ["squad_id"], name: "index_practices_on_squad_id"
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "squads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.boolean "active"
    t.string "name"
    t.string "competition"
    t.string "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_squads_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "squad_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_teams_on_squad_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email_address"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drills", "libraries"
  add_foreign_key "libraries", "users"
  add_foreign_key "players", "squads"
  add_foreign_key "plays", "libraries"
  add_foreign_key "practice_drills", "drills"
  add_foreign_key "practice_drills", "practices"
  add_foreign_key "practices", "squads"
  add_foreign_key "sessions", "users"
  add_foreign_key "squads", "users"
  add_foreign_key "taggings", "tags"
  add_foreign_key "teams", "squads"
end
