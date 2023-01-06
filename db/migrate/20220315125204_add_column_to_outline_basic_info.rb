class AddColumnToOutlineBasicInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_basic_infos, :detail_edit_flg, :integer, limit: 1
  end
end
