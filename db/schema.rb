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

ActiveRecord::Schema.define(:version => 20120906093501) do

  create_table "accounts", :force => true do |t|
    t.integer  "balance"
    t.string   "currency"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "ads", :force => true do |t|
    t.decimal  "amount"
    t.string   "area"
    t.decimal  "price",      :precision => 10, :scale => 5
    t.string   "offer",                                     :default => "buy", :null => false
    t.string   "method"
    t.integer  "user_id"
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
  end

  create_table "external_accounts", :force => true do |t|
    t.string   "bank"
    t.integer  "number"
    t.integer  "unique_code"
    t.string   "currency"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "examined_by_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "external_accounts", ["examined_by_id"], :name => "index_external_accounts_on_examined_by_id"
  add_index "external_accounts", ["user_id"], :name => "index_external_accounts_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "transactions", :force => true do |t|
    t.integer  "sender_account_id"
    t.string   "sender_account_type"
    t.integer  "receiver_account_id"
    t.string   "receiver_account_type"
    t.integer  "examined_by_id"
    t.integer  "amount"
    t.string   "status"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "transactions", ["examined_by_id"], :name => "index_transactions_on_examined_by_id"
  add_index "transactions", ["receiver_account_id"], :name => "index_transactions_on_receiver_account_id"
  add_index "transactions", ["sender_account_id"], :name => "index_transactions_on_sender_account_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
