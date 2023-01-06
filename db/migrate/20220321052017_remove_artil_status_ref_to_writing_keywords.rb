class RemoveArtilStatusRefToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    remove_column :writing_keywords, :article_status_id
  end
end
