class RemoveColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :google_refresh_token
    remove_column :users, :provider
    remove_column :users, :token
    remove_column :users, :expires_at
    remove_column :users, :expires
    remove_column :users, :refresh_token
  end
end
