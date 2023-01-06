class ChangeColumnToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    change_column :writing_keywords, :client_memo, :text
  end
end
