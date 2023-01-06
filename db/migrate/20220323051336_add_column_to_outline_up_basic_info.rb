class AddColumnToOutlineUpBasicInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_up_basic_infos, :cv_name2, :string, limit: 255
    add_column :outline_up_basic_infos, :destination_url2, :string, limit: 255
  end
end
