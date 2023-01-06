class AddColumnRelateKeywordErrorToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_column :writing_keywords, :related_keyword_message, :text
  end
end
