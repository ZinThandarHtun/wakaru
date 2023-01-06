class ChangeColumnToArtlineStauses < ActiveRecord::Migration[6.1]
  def change
    rename_column :artline_statuses, :article_status, :artline_status
    remove_column :artline_statuses, :batchuse_flg
  end
end
