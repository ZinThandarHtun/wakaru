class AddFilePathToWritingKeyword < ActiveRecord::Migration[6.1]
  def change
    add_column :writing_keywords, :excel_file_path, :string
    add_column :writing_keywords, :word_file_path, :string
  end
end
