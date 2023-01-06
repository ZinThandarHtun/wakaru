class AddColumnToOutlineBasicInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :outline_basic_infos, :lead_sentence_count, :integer
  end
end
