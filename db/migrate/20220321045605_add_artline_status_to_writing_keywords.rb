class AddArtlineStatusToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_reference :writing_keywords, :artline_status, foreign_key: true, default: 1
  end
end
