# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_06_005634) do

  create_table "accounts", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "saldo"
    t.integer "tipo_cuenta"
    t.boolean "tipo_familiar"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "nombre"
    t.integer "tipo"
    t.string "descripcion"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_concepts_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.decimal "saldo"
    t.string "nombre"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.decimal "cantidad"
    t.decimal "saldo"
    t.integer "family_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_goals_on_family_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "descripcion"
    t.decimal "cantidad"
    t.integer "account_id", null: false
    t.integer "concept_id", null: false
    t.integer "user_id", null: false
    t.integer "goal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_movements_on_account_id"
    t.index ["concept_id"], name: "index_movements_on_concept_id"
    t.index ["goal_id"], name: "index_movements_on_goal_id"
    t.index ["user_id"], name: "index_movements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "telefono"
    t.integer "tipo_usuario"
    t.integer "family_id"
    t.string "nombre"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warranties", force: :cascade do |t|
    t.string "nombre"
    t.string "no_identificacion"
    t.date "fecha_adq"
    t.string "estado"
    t.integer "periodo_dias"
    t.integer "dias_restantes"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_warranties_on_user_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "concepts", "users"
  add_foreign_key "families", "users"
  add_foreign_key "goals", "families"
  add_foreign_key "goals", "users"
  add_foreign_key "movements", "accounts"
  add_foreign_key "movements", "concepts"
  add_foreign_key "movements", "goals"
  add_foreign_key "movements", "users"
  add_foreign_key "users", "families"
  add_foreign_key "warranties", "users"
end
