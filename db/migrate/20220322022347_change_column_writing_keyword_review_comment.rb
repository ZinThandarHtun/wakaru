class ChangeColumnWritingKeywordReviewComment < ActiveRecord::Migration[6.1]
  def change
    change_column_null :writing_keyword_review_comments, :review_comment, true
  end
end
