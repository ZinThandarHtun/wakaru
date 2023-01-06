class ChangeColumnNameToArtlineStatuses < ActiveRecord::Migration[6.1]
  def change
    rename_column :artline_statuses, :create_user, :created_user
    rename_column :artline_statuses, :update_user, :updated_user
  end
end
