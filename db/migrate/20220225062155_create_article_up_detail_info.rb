class CreateArticleUpDetailInfo < ActiveRecord::Migration[6.1]
  def change
    create_table :article_up_detail_infos do |t|
      t.references :article_up_basic_info, null: false, foreign_key: true
      t.string :header_type, null: false, limit: 255
      t.string :header_title, null: false, limit: 255
      t.string :header_detail, null: false, limit: 255
      t.integer :word_count, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
