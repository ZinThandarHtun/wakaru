class AddGoogleAccountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :google_account, :string
  end
end
