class ChangeColumnNameToWritingKeywordReviewComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :writing_keyword_review_comments, :create_user, :created_user
    rename_column :writing_keyword_review_comments, :update_user, :updated_user
  end
end
