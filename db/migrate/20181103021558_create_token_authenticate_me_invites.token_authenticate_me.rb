# This migration comes from token_authenticate_me (originally 20160620184327)
class CreateTokenAuthenticateMeInvites < ActiveRecord::Migration[4.2]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
  end
end
