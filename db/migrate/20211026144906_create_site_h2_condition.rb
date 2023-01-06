class CreateSiteH2Condition < ActiveRecord::Migration[6.1]
  def change
    create_table :site_h2_conditions do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.references :site_info, null: false, foreign_key: true
      t.references :header_classification_dict, null: false, foreign_key: true
      t.integer :competingsite_h2_count, null: false
      t.integer :ownsite_h2_count, null: false
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :created_user, null: false
      t.integer :updated_user
      t.timestamps
    end
  end
end
