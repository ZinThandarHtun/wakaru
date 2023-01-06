class AddArticleStatusRefToWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    add_reference :writing_keywords, :article_status, foreign_key: true
  end
end
