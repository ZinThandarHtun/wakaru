class CreateArticleReviewResCompo < ActiveRecord::Migration[6.1]
  def change
    create_table :article_review_res_compos do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :outline_up_basic_info, foreign_key: true
      t.references :outline_up_detail_info, foreign_key: true
      t.references :article_up_basic_info, foreign_key: true
      t.references :article_up_detail_info, foreign_key: true
      t.integer :level_match, limit: 1
      t.integer :header_match, limit: 1
      t.integer :word_cnt_range, limit: 1
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user

      t.timestamps
    end
  end
end
