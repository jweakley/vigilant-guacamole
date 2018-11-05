# This migration comes from token_authenticate_me (originally 20160622203801)
class CreateTokenAuthenticateMeSessions < ActiveRecord::Migration[4.2]
  def change
    create_table :token_authenticate_me_sessions do |t|
      t.string   :key, null: false
      t.datetime :expiration
      t.integer  :user_id

      t.timestamps null: false
    end

    add_index :token_authenticate_me_sessions, :key, unique: true
    add_foreign_key :token_authenticate_me_sessions, :token_authenticate_me_users, column: :user_id
  end
end
