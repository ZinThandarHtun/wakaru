class ChangeColumnToArticleUpDetailInfos < ActiveRecord::Migration[6.1]
  def change
    change_column :article_up_detail_infos, :header_detail, :text
  end
end
