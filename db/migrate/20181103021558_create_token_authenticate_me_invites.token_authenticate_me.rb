# This migration comes from token_authenticate_me (originally 20160620184327)
class CreateTokenAuthenticateMeInvites < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table(:token_authenticate_me_invites, id: :uuid) do |t|
      t.string :email, null: false
      t.boolean :accepted, default: nil
      t.jsonb :meta, null: false, default: '{}'
      t.integer :creator_id, index: true

      t.timestamps null: false
    end
  end
end
