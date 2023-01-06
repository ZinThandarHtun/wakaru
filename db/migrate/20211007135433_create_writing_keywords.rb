class CreateWritingKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :writing_keywords do |t|
      t.string :writing_keyword, null: false, limit: 255
      t.datetime :search_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :project_info, foreign_key: true
      t.references :outline_status, null: false, foreign_key: true
      t.string :client_memo, limit: 255
      t.integer :check_status, limit: 1, default: 0
      t.integer :excel_status, limit: 1, default: 0
      t.integer :menu_id, default: 0
      t.integer :del_flg, null: false, limit: 1, default: 0
      t.boolean :batch_flg, default: false
      t.boolean :h2h3batch_flg, default: false
      t.integer :create_user, null: false
      t.integer :update_user
      t.timestamps
    end
  end
end
