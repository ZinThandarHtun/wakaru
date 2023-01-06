class AddNewColumnToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_column :writing_keywords, :dummy_message, :jsonb
  end
end
