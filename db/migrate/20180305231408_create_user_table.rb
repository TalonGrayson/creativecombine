class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tables do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet "current_sign_in_ip"
      t.inet "last_sign_in_ip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "username"
      t.string "uid"
      t.string "token"
      t.boolean "admin", default: false
      t.boolean "staff", default: false
      t.boolean "active", default: true
      t.string "provider"
      t.string "image_url"
      t.string "description", default: ""
      t.boolean "owner", default: false
      t.string "broadcaster_type", default: ""
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    endw
  end
end
