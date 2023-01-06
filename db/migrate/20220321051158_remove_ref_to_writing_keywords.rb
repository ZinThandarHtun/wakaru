class RemoveRefToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    remove_reference :writing_keywords, :artline_status, foreign_key: true
  end
end
