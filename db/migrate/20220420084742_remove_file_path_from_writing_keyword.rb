class RemoveFilePathFromWritingKeyword < ActiveRecord::Migration[6.1]
  def change
    remove_column :writing_keywords, :excel_file_path
    remove_column :writing_keywords, :word_file_path
  end
end
