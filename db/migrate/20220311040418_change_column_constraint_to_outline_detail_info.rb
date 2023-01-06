class ChangeColumnConstraintToOutlineDetailInfo < ActiveRecord::Migration[6.1]
  def change
    change_column_null :outline_detail_infos, :header_title, true
  end
end
