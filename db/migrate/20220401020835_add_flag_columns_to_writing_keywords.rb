class AddFlagColumnsToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_column :writing_keywords, :h2h3_inserted_flag, :integer, limit: 1, default: 0
  end
end
