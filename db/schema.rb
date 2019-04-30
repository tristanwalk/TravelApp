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

ActiveRecord::Schema.define(version: 2019_04_13_155743) do

  create_table "accounts", force: :cascade do |t|
    t.string "firstName", default: "", null: false
    t.string "lastName", default: "", null: false
    t.integer "empID"
    t.integer "deptNum"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "budget_approvers", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "email", null: false
    t.integer "empID"
    t.integer "deptNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.integer "currentBudget"
    t.integer "totalBudget"
    t.string "name"
    t.integer "deptNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "email", null: false
    t.integer "empID"
    t.integer "deptNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_reports", force: :cascade do |t|
    t.integer "tripNum", null: false
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.integer "empID", null: false
    t.integer "deptNum", null: false
    t.integer "formNum", null: false
    t.date "departDate", null: false
    t.date "returnDate", null: false
    t.text "destination", null: false
    t.string "purpose", null: false
    t.string "status", default: "Pending", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expenseName", null: false
    t.integer "expectedAmount", null: false
    t.integer "actualAmount"
    t.string "approval", default: "Pending", null: false
    t.integer "travel_authorization_id"
    t.integer "expense_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_report_id"], name: "index_expenses_on_expense_report_id"
    t.index ["travel_authorization_id"], name: "index_expenses_on_travel_authorization_id"
  end

  create_table "payment_managers", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "email", null: false
    t.integer "empID"
    t.integer "deptNum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "image_url"
    t.integer "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_receipts_on_expense_id"
  end

  create_table "sources", force: :cascade do |t|
    t.integer "department", null: false
    t.integer "amount", null: false
    t.string "approval", default: "Pending", null: false
    t.integer "travel_authorization_id"
    t.integer "expense_report_id"
    t.integer "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_sources_on_expense_id"
    t.index ["expense_report_id"], name: "index_sources_on_expense_report_id"
    t.index ["travel_authorization_id"], name: "index_sources_on_travel_authorization_id"
  end

  create_table "super_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_authorizations", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.integer "empID", null: false
    t.integer "tripNum", null: false
    t.integer "deptNum", null: false
    t.integer "formNum", null: false
    t.date "departDate", null: false
    t.date "returnDate", null: false
    t.text "destination", null: false
    t.string "purpose", null: false
    t.string "status", default: "Pending", null: false
    t.string "comment", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
