class ChangeColumns < ActiveRecord::Migration[6.1]
  def change
    change_column_null :outline_detail_infos, :outline_basic_info_id, true
    change_column_null :outline_detail_infos, :writing_policy_id, true
    change_column_null :outline_detail_infos, :header_detail, true
    change_column_null :outline_detail_infos, :ref_url, true
    change_column_null :outline_detail_infos, :word_count, true
  end
end
