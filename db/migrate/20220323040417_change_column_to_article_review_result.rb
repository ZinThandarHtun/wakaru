class ChangeColumnToArticleReviewResult < ActiveRecord::Migration[6.1]
  def change
    change_column :article_review_results, :cv_comment, :text
    change_column :article_review_results, :outline_cmt, :text
    change_column :article_review_results, :wordcnt_cmt, :text
    change_column :article_review_results, :ng_cmt, :text
    change_column :article_review_results, :projectng_cmt, :text
    change_column :article_review_results, :line_cmt, :text
    change_column :article_review_results, :linebreak_comment, :text
    change_column :article_review_results, :overall_cmt, :text
  end
end
