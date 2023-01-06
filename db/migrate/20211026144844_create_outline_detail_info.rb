class CreateOutlineDetailInfo < ActiveRecord::Migration[6.1]
  def change
    create_table :outline_detail_infos do |t|    
      t.references :outline_basic_info, null: false, foreign_key: true
      t.references :header_classification_dict, null: false, foreign_key: true
      t.references :writing_policy, null: false, foreign_key: true
      t.references :site_info, null: false, foreign_key: true
      t.string :header_type, null: false, limit: 255
      t.string :header_title, null: false, limit: 255
      t.string :header_detail, null: false, limit: 255
      t.string :ref_url, null: false, limit: 255
      t.integer :word_count, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
