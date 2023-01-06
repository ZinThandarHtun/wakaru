class ChangeTableNameToArticlStatuses < ActiveRecord::Migration[6.1]
  def change
    rename_table :article_statuses, :artline_statuses
  end
end
