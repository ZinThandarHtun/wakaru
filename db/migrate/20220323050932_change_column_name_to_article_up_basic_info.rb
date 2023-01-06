class ChangeColumnNameToArticleUpBasicInfo < ActiveRecord::Migration[6.1]
  def change
    rename_column :article_up_basic_infos, :cv_name, :cv_name1
    rename_column :article_up_basic_infos, :destination_url, :destination_url1
  end
end
