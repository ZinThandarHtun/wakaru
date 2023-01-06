class CreateSiteInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :site_infos do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.integer :site_no, null: false
      t.text :site_title, null: false
      t.text :site_url, null: false
      t.integer :selected, limit: 1, default: 0
      t.integer :h2_count
      t.integer :h3_count
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
