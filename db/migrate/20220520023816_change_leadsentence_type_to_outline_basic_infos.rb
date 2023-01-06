class ChangeLeadsentenceTypeToOutlineBasicInfos < ActiveRecord::Migration[6.1]
  def change
    change_column :outline_basic_infos, :lead_sentence, :text
  end
end
