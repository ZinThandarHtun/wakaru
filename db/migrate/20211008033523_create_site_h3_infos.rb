class CreateSiteH3Infos < ActiveRecord::Migration[6.1]
  def change
    create_table :site_h3_infos do |t|
      t.references :site_info, null: false, foreign_key: true
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :header_classification_dict, foreign_key: true
      t.references :site_h2_info, null: false, foreign_key: true
      t.jsonb :h3
      t.jsonb :h3_nouns
      t.integer :selected, limit: 1, default: 1
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
