class ChangeColumnToArticleReviewResIndents < ActiveRecord::Migration[6.1]
  def change
    rename_column :article_review_res_indents, :word_count_ok, :linebreak_cnt
  end
end
