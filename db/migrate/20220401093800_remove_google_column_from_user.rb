class RemoveGoogleColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :google_account
  end
end
