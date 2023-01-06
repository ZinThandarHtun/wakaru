class AddLeadSentenceDelFlgColumnToOutlineBasicInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_basic_infos, :lead_sentence_del_flg, :integer, null: false, limit: 1, default: 0
  end
end
