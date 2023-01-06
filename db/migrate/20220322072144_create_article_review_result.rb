class CreateArticleReviewResult < ActiveRecord::Migration[6.1]
  def change
    create_table :article_review_results do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.integer :cv_result, null: false, limit: 1
      t.integer :title_result, null: false, limit: 1
      t.integer :outline_result, null: false, limit: 1
      t.integer :wordcnt_result, null: false, limit: 1
      t.integer :ng_result, null: false
      t.integer :projectng_result, null: false
      t.integer :line_result, null: false
      t.integer :linebreak_result, null: false, limit: 1
      t.string :cv_comment, limit: 255
      t.string :outline_cmt, limit: 255
      t.string :wordcnt_cmt, limit: 255
      t.string :ng_cmt, limit: 255
      t.string :projectng_cmt, limit: 255
      t.string :line_cmt, limit: 255
      t.string :linebreak_comment, limit: 255
      t.string :overall_cmt, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user

      t.timestamps
    end
  end
end
