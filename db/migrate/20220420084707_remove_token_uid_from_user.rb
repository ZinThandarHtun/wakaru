class RemoveTokenUidFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :google_token
    remove_column :users, :uid
  end
end
