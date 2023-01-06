class ChangeColumnsToArticleReviewResults < ActiveRecord::Migration[6.1]
  def change
    rename_column :article_review_results, :cv_result, :cv1_result
    add_column :article_review_results, :cv2_result, :integer, limit: 1
    add_column :article_review_results, :url1_result, :integer, limit: 1
    add_column :article_review_results, :url2_result, :integer, limit: 1
    add_column :article_review_results, :lead_sen_result, :integer, limit: 1
    rename_column :article_review_results, :cv_comment, :cv_cmt
    rename_column :article_review_results, :linebreak_comment, :linebreak_cmt
  end
end
