class ChangeColumsToOutLineDetailInfos < ActiveRecord::Migration[6.1]
  def change
    change_column :outline_detail_infos, :header_title, :text
    change_column :outline_detail_infos, :header_detail, :text
    change_column :outline_detail_infos, :ref_url, :text
  end
end
