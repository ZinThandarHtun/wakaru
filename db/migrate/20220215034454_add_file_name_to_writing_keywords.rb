class AddFileNameToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_column :writing_keywords, :file_name, :string
  end
end
