class CreateArticleReviewResultNotation < ActiveRecord::Migration[6.1]
  def change
    create_table :article_review_result_notations do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :ng_word, foreign_key: true
      t.references :project_ng_word, foreign_key: true
      t.integer :hit_count, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user

      t.timestamps
    end
  end
end
