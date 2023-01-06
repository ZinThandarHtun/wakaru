class CreateRelatedKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :related_keywords do |t|
      t.references :writing_keyword, null: false, foreign_key: true
      t.string :keyword, limit: 255
      t.string :search_volume, limit: 255
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
