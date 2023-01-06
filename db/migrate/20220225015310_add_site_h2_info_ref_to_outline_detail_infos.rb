class AddSiteH2InfoRefToOutlineDetailInfos < ActiveRecord::Migration[6.1]
  def change
    add_reference :outline_detail_infos, :site_h2_info, foreign_key: true
    add_reference :outline_detail_infos, :site_h3_info, foreign_key: true
    add_column :outline_detail_infos, :display_order, :integer
  end
end
