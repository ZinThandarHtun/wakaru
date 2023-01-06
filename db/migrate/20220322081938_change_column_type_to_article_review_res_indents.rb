class ChangeColumnTypeToArticleReviewResIndents < ActiveRecord::Migration[6.1]
  def change
    change_column :article_review_res_indents, :comma_cnt, :integer, limit: 1
    change_column :article_review_res_indents, :line_word_cnt, :integer, limit: 1
  end
end
