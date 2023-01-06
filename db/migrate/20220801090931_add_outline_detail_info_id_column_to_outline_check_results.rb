class AddOutlineDetailInfoIdColumnToOutlineCheckResults < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_check_results, :outline_detail_info_id, :integer
  end
end
