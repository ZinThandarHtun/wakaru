class CreateWritingKeywordReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :writing_keyword_review_comments do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :outline_status, null:false, foreign_key: true
      t.string :review_comment, null: false, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
