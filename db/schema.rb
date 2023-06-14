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

ActiveRecord::Schema[7.0].define(version: 2023_06_14_062334) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "jti", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["jti"], name: "index_administrators_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "telephone"
    t.string "cpf"
    t.string "jti", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["jti"], name: "index_clients_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "movements", force: :cascade do |t|
    t.float "cost"
    t.bigint "vehicle_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_movements_on_client_id"
    t.index ["vehicle_id"], name: "index_movements_on_vehicle_id"
  end

  create_table "parkings", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.time "opening_time"
    t.time "closing_time"
    t.bigint "administrator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_id"], name: "index_parkings_on_administrator_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "cardholder_name"
    t.string "card_number"
    t.string "validity"
    t.integer "security_code"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payment_methods_on_client_id"
  end

  create_table "vacancies", force: :cascade do |t|
    t.string "code"
    t.integer "kind"
    t.bigint "parking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_id"], name: "index_vacancies_on_parking_id"
  end

  create_table "vacancy_reservations", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "vacancy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_vacancy_reservations_on_client_id"
    t.index ["vacancy_id"], name: "index_vacancy_reservations_on_vacancy_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "nickname"
    t.string "plate"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_vehicles_on_client_id"
  end

  add_foreign_key "movements", "clients"
  add_foreign_key "movements", "vehicles"
  add_foreign_key "parkings", "administrators"
  add_foreign_key "payment_methods", "clients"
  add_foreign_key "vacancies", "parkings"
  add_foreign_key "vacancy_reservations", "clients"
  add_foreign_key "vacancy_reservations", "vacancies"
  add_foreign_key "vehicles", "clients"
end
