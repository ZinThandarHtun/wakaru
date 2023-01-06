class CreateOutlineBasicInfo < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_basic_infos do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.string :user_attribute, null: false, limit: 255
      t.string :search_condition, null: false, limit: 255
      t.string :article_width, limit: 255
      t.integer :articlewidth_writing_policy_id
      t.string :article_depth, limit: 255
      t.integer :articledepth_writing_policy_id
      t.string :article_readability, limit: 255
      t.integer :articlereadability_writing_policy_id
      t.string :cv_guidance, limit: 255
      t.string :cv_name, limit: 255
      t.string :destination_url, limit: 255
      t.string :feature_image, limit: 255
      t.string :title, limit: 255
      t.string :lead_sentence, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
