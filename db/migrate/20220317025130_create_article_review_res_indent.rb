class CreateArticleReviewResIndent < ActiveRecord::Migration[6.1]
  def change
    create_table :article_review_res_indents do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :article_up_detail_info, foreign_key: true
      t.references :article_up_basic_info, foreign_key: true
      t.string :line_detail, null: false, limit: 255
      t.integer :comma_cnt_35, null: false, limit: 1, default: 0
      t.integer :comma_cnt, null: false
      t.integer :line_word_cnt, null: false
      t.integer :word_count_ok, null: false, limit: 1, default: 0
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user

      t.timestamps
    end
  end
end
